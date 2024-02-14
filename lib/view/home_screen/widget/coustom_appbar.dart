import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:store/view/auth_screens/sign_in.dart';

import '../../../Constants/images.dart';
import '../../../services/firebase_create_new_credintal_user.dart';

class CoustomAppBar extends StatelessWidget {
  const CoustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(
              Images.textLogo,
              width: MediaQuery.of(context).size.width * 0.58,
            ),
          ),
          Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications),
              color: Colors.black),
          Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text("Log out"),
                          content: Text("Are you sure you want to log out?"),
                          actions: [
                            CupertinoDialogAction(
                              child: Text("Yes"),
                              onPressed: () {
                                UserCredit.signOut();
                                Get.offAll(SignIn());
                              },
                            ),
                            CupertinoDialogAction(
                              child: Text("No"),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ],
                        );
                      });
                },
                icon: Icon(Icons.menu),
                color: Colors.black),
          ),
        ],
      ),
    );
  }

  @override
  List<Object?> get props => [];
}
