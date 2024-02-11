import 'package:get/get.dart';
import 'package:store/services/firebase_auth.dart';
import 'package:store/view/navigation/navigation_control.dart';

class AuthController {
  void signUpFun(emailController, passwordController) {
    bool validfun = validatefildes(emailController, passwordController);
    if (validfun == true) {
      try {
        UserFirebaseAuth()
            .SignUpFun(emailController.text, passwordController.text);
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

  void signInFun(emailController, passwordController) async {
    bool validfun = validatefildes(emailController, passwordController);
    if (validfun == true) {
      try {
        bool signInSuccessful = await UserFirebaseAuth()
            .SignInFun(emailController.text, passwordController.text);
        if (signInSuccessful) {
          Get.to(() => NavigationControl());
        } else {
          Get.snackbar(
            'ops!', // title
            'You dont have account', // message
            snackPosition: SnackPosition.TOP,
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
}