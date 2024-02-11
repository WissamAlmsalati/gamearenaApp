import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class UserFirebaseAuth {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> SignUpFun(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  Future<void> SignInFun(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> SignOutFun() async {
    await _auth.signOut();
  }
}
