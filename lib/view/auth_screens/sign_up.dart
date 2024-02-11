import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:store/view/auth_screens/methode/validate_filds.dart';
import 'package:store/view/auth_screens/sign_in.dart';
import 'package:store/view/auth_screens/widgets/auth_text_filed.dart';
import '../../Constants/images.dart';

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
                keyboardType: TextInputType.name,
              ),
              AuthTextFilled(
                controller: lastNameController,
                hintText: "Last name",
                icon: Icons.person,
                keyboardType: TextInputType.name,
              ),
              AuthTextFilled(
                controller: emailController,
                hintText: "Email",
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              AuthTextFilled(
                controller: phoneNumberController,
                hintText: "Phone Number",
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
              ),
              AuthTextFilled(
                controller: passwordController,
                hintText: "Password",
                icon: Icons.lock,
                keyboardType: TextInputType.visiblePassword,
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
                onPressed: () => authController.signUpFun(
                    emailController, passwordController),
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
    );
  }
}
