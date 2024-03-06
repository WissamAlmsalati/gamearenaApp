import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants/images.dart';
import '../../services/firebase_create_new_credintal_user.dart';
import '../navigation/navigation_control.dart';
import '../auth_screens/methode/validate_filds.dart';
import '../auth_screens/sign_in.dart';
import '../auth_screens/widgets/auth_text_filed.dart';
import 'package:firebase_core/firebase_core.dart';

class SignUp extends StatelessWidget {
  final AuthController authController = AuthController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Form(
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Text("I agree to the terms and conditions"),
                        Checkbox(
                          value: true,
                          onChanged: null,
                        )
                      ],
                    ),
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
                        authController.signUpFun(
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
      ),
    );
  }
}
