import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:store/controler/navigaton_screen_cubit/navigationcontrol_cubit.dart';
import 'package:store/view/auth_screens/methode/validate_filds.dart';
import 'package:store/view/auth_screens/sign_in.dart';
import 'package:store/view/auth_screens/widgets/auth_text_filed.dart';
import '../../Constants/images.dart';
import '../../services/firebase_create_new_credintal_user.dart';
import 'package:firebase_core/firebase_core.dart';

import '../navigation/navigation_control.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(Images.textLogo),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                AuthTextFilled(
                  controller: firstNameController,
                  hintText: "First name",
                  icon: Icons.person,
                ),
                AuthTextFilled(
                  controller: lastNameController,
                  hintText: "Last name",
                  icon: Icons.person,
                ),
                AuthTextFilled(
                  controller: emailController,
                  hintText: "Email",
                  icon: Icons.email,
                ),
                AuthTextFilled(
                  controller: phoneNumberController,
                  hintText: "Phone Number",
                  icon: Icons.phone,
                ),
                AuthTextFilled(
                  controller: passwordController,
                  hintText: "Password",
                  icon: Icons.lock,
                ),
                Row(
                  children: [
                    Text("I agree to the terms and conditions"),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.9, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
  if (emailController.text.isNotEmpty &&
      passwordController.text.isNotEmpty &&
      firstNameController.text.isNotEmpty &&
      lastNameController.text.isNotEmpty &&
      phoneNumberController.text.isNotEmpty) {
    AuthController().signUpFun(
      emailController,
      passwordController,
      firstNameController,
      lastNameController,
      phoneNumberController,
    );
  } else {
    print('One or more fields are empty');
  }
},
                  child: Text("Sign Up"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Get.to(() => SignIn());
                      },
                      child: Text("Sign In"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
