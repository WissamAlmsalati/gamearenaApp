import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/view/navigation/navigation_control.dart';

import '../../../services/firebase_create_new_credintal_user.dart';
class AuthController {
  Future<void> signUpFun(emailController, passwordController,firstnameCnotroler,lastnameControler,phoneControler) async {
    bool validfun = validatefildes(emailController, passwordController);
    if (validfun == true) {
      try {
        await UserCredit.signUpAndCreateDocument(
            emailController.text, passwordController.text,firstnameCnotroler.text,lastnameControler.text,phoneControler.text,'user');
        print("user created");
        Get.to(() => NavigationControl());
      } catch (e) {
        Get.snackbar(
          'Error', // title
          e.toString(), // message
          snackPosition: SnackPosition.TOP,
        );
      }
    }
  }
}

void signInFun(emailController, passwordController) async {
  bool validfun = validatefildes(emailController, passwordController);
  if (validfun == true) {
    try {
      bool isEmailNew = await UserCreditTest.isEmailNew(emailController.text);
      if (!isEmailNew) {
        bool signInSuccessful = await UserCredit.signInFun(emailController.text, passwordController.text);
        if (signInSuccessful) {
          Get.to(() => NavigationControl());
        } else {
          Get.snackbar(
            'ops!', // title
            'You dont have account', // message
            snackPosition: SnackPosition.TOP,
          );
        }
      } else {
        Get.dialog(
          AlertDialog(
            title: Text('Error'),
            content: Text('This email is not registered.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error', // title
        e.toString(), // message
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}

bool validatefildes(emailController, passwordController) {
  if (emailController.text.isEmpty || passwordController.text.isEmpty) {
    Get.snackbar(
      'Error', // title
      'Please fill all the fildes', // message
      snackPosition: SnackPosition.TOP,
    );
    return false;
  } else {
    return true;
  }
}

class UserCreditTest {
  static Future<bool> isEmailNew(String email) async {
    final users = FirebaseFirestore.instance.collection('users');
    final querySnapshot = await users.where('email', isEqualTo: email).get();
    return querySnapshot.docs.isEmpty;
  }
}