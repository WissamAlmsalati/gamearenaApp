import 'package:get/get.dart';
import 'package:store/view/navigation/navigation_control.dart';

import '../../../services/firebase_create_new_credintal_user.dart';

class AuthController {

  void signUpFun(emailController, passwordController,firstnameCnotroler,lastnameControler,phoneControler) {
    bool validfun = validatefildes(emailController, passwordController);
    if (validfun == true) {
      try {
        UserCredit.signUpAndCreateDocument(
            emailController.text, passwordController.text,firstnameCnotroler.text,lastnameControler.text,phoneControler.text,'user');
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

 //void signInFun(emailController, passwordController) async {
 //  bool validfun = validatefildes(emailController, passwordController);
 //  if (validfun == true) {
 //    try {
 //      bool signInSuccessful = await UserFirebaseAuth()
 //          .SignInFun(emailController.text, passwordController.text);
 //      if (signInSuccessful) {
 //        Get.to(() => NavigationControl());
 //      } else {
 //        Get.snackbar(
 //          'ops!', // title
 //          'You dont have account', // message
 //          snackPosition: SnackPosition.TOP,
 //        );
 //      }
 //    } catch (e) {
 //      Get.snackbar(
 //        'Error', // title
 //        e.toString(), // message
 //        snackPosition: SnackPosition.TOP,
 //      );
 //    }
 //  }
 //}

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
