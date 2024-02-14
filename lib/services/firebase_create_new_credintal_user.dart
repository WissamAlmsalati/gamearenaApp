import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserCredit {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Make handleError a static method so it can be called from other static methods
  static void handleError(String message) {
    print(message);
  }

  static Future<bool> signUpAndCreateDocument(
      String email, String password, String firstName, String lastName,
      [Map<String, dynamic>? additionalFields]) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String userId = userCredential.user!.uid;

      Map<String, dynamic> userData = {
        'userId': userId,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        ...?additionalFields,
      };

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .set(userData);

      // Return true if user creation and document creation succeed
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        handleError('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        handleError('The account already exists for that email.');
      }
      // Return false if user creation fails
      return false;
    } catch (e) {
      handleError(e.toString());
      // Return false if an unexpected error occurs
      return false;
    }
  }

  static Future<Map<String, dynamic>?> getUserData(String userId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (documentSnapshot.exists) {
        return documentSnapshot.data() as Map<String, dynamic>;
      } else {
        print('No user found with this ID');
        return null;
      }
    } catch (e) {
      handleError(e.toString());
      return null;
    }
  }

  //create a methode for sign out
  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
