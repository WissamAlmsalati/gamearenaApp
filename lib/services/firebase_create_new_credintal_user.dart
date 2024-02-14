import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class UserCredit{
  

  // Replace with your actual error handling functions
void handleError(String message) {
  // Log error message, display user-friendly alert, etc.
  print(message);
}

static Future<bool> signUpAndCreateDocument(String email, String password, String firstName, String lastName, [Map<String, dynamic>? additionalFields]) async {
  // User creation
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    String userId = userCredential.user!.uid;

    // User data preparation
    Map<String, dynamic> userData = {
      'userId': userId,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      // Add any additional fields if provided
      ...?additionalFields,
    };

    // Document creation
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .set(userData);

    return true; // Sign-up and document creation successful
  } on FirebaseAuthException catch (e) {
    handleError("Error creating user: ${e.message}");
  } catch (e) {
    handleError("Error creating document: ${e.toString()}");
  }
  return false; // Sign-up or document creation failed
}


}