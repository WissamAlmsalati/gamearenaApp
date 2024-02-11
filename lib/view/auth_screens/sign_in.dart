import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:store/services/firebase_auth.dart';
import 'package:store/view/auth_screens/sign_up.dart';
import 'package:store/view/auth_screens/widgets/auth_text_filed.dart';

import '../../Constants/images.dart';
import '../navigation/navigation_control.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
   late TextEditingController emailControler = TextEditingController();
   late TextEditingController passwordControler = TextEditingController();


    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

      ),
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
                controller: emailControler,
                hintText: "Email",
                icon: Icons.email, keyboardType: TextInputType.emailAddress,
              ),
              AuthTextFilled(
                controller: passwordControler,
                hintText: "Password",
                icon: Icons.lock, keyboardType: TextInputType.visiblePassword,
              ),
              Row(
                children:[
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
              primary: Colors.black,

              minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed:()=> login(emailControler, passwordControler),
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
            Get.to(()=>SignUp());    },
                    child: Text("Sign Up"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
  Future<void> login( emailControler, passwordControler) async {
    try{
      Get.find<UserFirebaseAuth>().SignInFun(emailControler.text, passwordControler.text);
      Get.to(()=>NavigationControl());
    } catch (e) {
      print(e);
    }}
}