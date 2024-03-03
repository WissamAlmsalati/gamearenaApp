import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/view/auth_screens/sign_in.dart';

import '../../../Constants/images.dart';
import '../../../services/firebase_create_new_credintal_user.dart';
import '../../adminview/admin.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String userId = FirebaseAuth.instance.currentUser!.uid;

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
          FutureBuilder(
            future: UserCredit.getUserData(userId),
            builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Placeholder widget while data is being fetched
              } else if (snapshot.hasError) {
                // Handle the error by returning an appropriate widget
                return Text('Error: ${snapshot.error}');
              } else {
                final String userRole = snapshot.data?['roleAcount'] ?? "user";
                if (userRole == "user") {
                  return IconButton(
                    onPressed: () {},
                    icon: Icon(EneftyIcons.notification_2_bold),
                  );
                } else if (userRole == "admin") {
                  return IconButton(
                    onPressed: () {
                      Get.to(() => AdminScreen());
                    },
                    icon: Icon(EneftyIcons.add_bold),
                  );
                } else {
                  return Container(); // Placeholder widget if user role is neither "user" nor "admin"
                }
              }
            },
          ),

        IconButton(onPressed: (){}, icon: Icon(Icons.circle_notifications),)
        ],
      ),
    );
  }
}
