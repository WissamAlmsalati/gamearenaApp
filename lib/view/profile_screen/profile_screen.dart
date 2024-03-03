import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../services/firebase_create_new_credintal_user.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String userId = FirebaseAuth.instance.currentUser!.uid;

    return FutureBuilder<Map<String, dynamic>?>(
      future: UserCredit.getUserData(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else {
          final userData = snapshot.data;
          final String userName = userData?['firstName'] ?? 'No Name';
          final String phoneNumber=userData?['phone']??"no phone number";

          return Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Center(
                  child: Column(
                      children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration:const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/images/profile.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(userName), // Display the user's name here
                        Text(phoneNumber),
                        Text("Location")
                      ],
                    ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.09,
                        ),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.9,
                            child: Column(

                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween
                                  ,
                                  children: [
                                    Icon(Icons.border_all),
                                    Text("Order History"),
                                    IconButton(onPressed: () {  }, icon: Icon(Icons.arrow_right_alt),)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.border_all),
                                    Text("Shipping Adress"),
                                    IconButton(onPressed: () {  }, icon: Icon(Icons.arrow_right_alt),)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.border_all),
                                    Text("Privacy and policy"),
                                    IconButton(onPressed: () {  }, icon: Icon(Icons.arrow_right_alt),)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.border_all),
                                    Text("Settengs"),
                                    IconButton(onPressed: () {  }, icon: Icon(Icons.arrow_right_alt),)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.border_all),
                                    Text("Log Out"),
                                    IconButton(onPressed: () {  }, icon: Icon(Icons.arrow_right_alt),)
                                  ],
                                )
                              ],

                            ),
                          ),
                        )
                  ]),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}