import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:store/Constants/images.dart';
import 'package:store/view/auth_screens/methode/validate_filds.dart';
import 'package:store/view/auth_screens/widgets/auth_text_filed.dart';
import 'package:store/view/navigation/navigation_control.dart';
import "package:store/view/auth_screens/screens/sign_up.dart";

import '../../../services/firebase_create_new_credintal_user.dart';


class SignIn extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

   SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();


    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(Images.textLogo),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  AuthTextFilled(
                    controller: emailController,
                    hintText: "Email",
                    icon: Icons.email,
                  ),
                  AuthTextFilled(
                    controller: passwordController,
                    hintText: "Password",
                    icon: Icons.lock,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (bool? newValue) {
                          newValue = newValue!;
                        },
                      ),
                      Text("Remember me"),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.9, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        bool signInSuccess = await UserCredit.signInFun(
                          emailController.text,
                          passwordController.text,
                        );
                        if (signInSuccess) {
                          print('User signed in successfully');
                          Get.to(() => NavigationControl());
                          // Navigate to the next screen
                        } else {
                          print('Sign in failed');
                        }
                      } else {
                        print('Email or password field is empty');
                      }
                    },

                    child: Text("Sign In"),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Get.to(() => SignUp());
                        },
                        child: Text("Sign Up"),
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
