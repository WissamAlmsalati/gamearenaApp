import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:store/services/firebase_auth.dart';
import 'package:store/view/auth_screens/sign_in.dart';

import '../../../Constants/images.dart';

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
                  UserFirebaseAuth().SignOutFun();
                  Get.to(() => SignIn());
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
