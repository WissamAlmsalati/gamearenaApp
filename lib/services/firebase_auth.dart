import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class UserFirebaseAuth {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> SignUpFun(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
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
