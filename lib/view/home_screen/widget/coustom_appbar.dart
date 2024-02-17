import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:store/view/auth_screens/sign_in.dart';

import '../../../Constants/images.dart';
import '../../../services/firebase_create_new_credintal_user.dart';
import '../../adminview/admin.dart';

class CoustomAppBar extends StatelessWidget {
  const CoustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final String userId=FirebaseAuth.instance.currentUser!.uid;

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
              final String Userrole = snapshot.data?['roleAcount']?? "user";
              return IconButton(onPressed: (){
                if(Userrole=="admin"){
                  Get.to(()=>AdminScreen());
                }else if(Userrole=="user"){
                  showDialog(context: context, builder: (context){
                    return Container(
                      color: Colors.red,
                      height:  100,
                      width: 100,

                      child: Text("You are not admin"),
                    );
                  });
                }
              }, icon: Icon(Icons.abc));
            },

          ),
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
