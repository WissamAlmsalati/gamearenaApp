import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserFirebaseAuth {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  Stream<User?> get authStateChanges => _auth.authStateChanges();

 Future<void> SignUpFun(String email, String password, String firstName, String lastName, String phoneNumber) async {
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    
    // After the user is created, we create a new document in the 'users' collection
    await _firestore.collection('users').doc(userCredential.user!.uid).set({
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
    });
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

  Future<bool> SignInFun(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true; // Return true if sign-in is successful
    } catch (e) {
      print(e); // Print the error message to the console
      return false; // Return false if sign-in fails
    }
  }

  Future<void> SignOutFun() async {
    await _auth.signOut();
  }
}