import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserCredit {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  static Future<bool> signUpAndCreateDocument(String email, String password,
      String firstName, String lastName,String phone, String? roleAcount,
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
        'phone':phone,
        'roleAcount': roleAcount,
      };

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .set(userData);

      return true;
    } on FirebaseAuthException catch (e) {
      ErrorHandler.handleError(e.code);
      return false;
    } catch (e) {
      ErrorHandler.handleError(e.toString());
      return false;
    }
  }

  static Future<bool> signInFun(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user != null;
    } on FirebaseAuthException catch (e) {
      ErrorHandler.handleError(e.code);
      return false;
    }
  }

  static Future<Map<String, dynamic>?> getUserData(String userId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      return documentSnapshot.exists ? documentSnapshot.data() as Map<String, dynamic> : null;
    } catch (e) {
      ErrorHandler.handleError(e.toString());
      return null;
    }
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}


class ErrorHandler {
  static void handleError(String errorCode) {
    switch (errorCode) {
      case 'weak-password':
        print('The password provided is too weak.');
        break;
      case 'email-already-in-use':
        print('The account already exists for that email.');
        break;
      case 'user-not-found':
        print('No user found for that email.');
        break;
      case 'wrong-password':
        print('Wrong password provided for that user.');
        break;
      default:
        print('An error occurred: $errorCode');
        break;
    }
  }
}