import 'package:enefty_icons/enefty_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../map_screen.dart';
import '../../services/firebase_create_new_credintal_user.dart';
import '../auth_screens/sign_in.dart';
import 'widgets/user_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final String userId = FirebaseAuth.instance.currentUser!.uid;

    return FutureBuilder<Map<String, dynamic>?>(
      future: UserCredit.getUserData(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
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
          final String phoneNumber = userData?['phone'] ?? "no phone number";

          return Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: Padding(
                padding:  const EdgeInsets.only(left: 10, right: 10),
                child: Center(
                  child: Column(children: [
                    UserInfoView(
                      userName: userName,
                      phoneNumber: phoneNumber,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(EneftyIcons.shopping_cart_outline),
                                const Text("Order History"),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      EneftyIcons.arrow_bottom_outline),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(EneftyIcons.location_outline),
                                const Text("Shipping Adress"),
                                IconButton(
                                  onPressed: () {
                                    Get.to(const MapScreen());
                                  },
                                  icon: const Icon(
                                      EneftyIcons.arrow_bottom_outline),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(EneftyIcons.profile_outline),
                                const Text("Privacy and policy"),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      EneftyIcons.arrow_bottom_outline),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(EneftyIcons.setting_outline),
                                const Text("Settings"),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      EneftyIcons.arrow_bottom_outline),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(EneftyIcons.logout_outline),
                                const Text("Log Out"),
                                Builder(
                                  builder: (context) => IconButton(
                                      onPressed: () {
                                        showCupertinoDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: const Text("Log out"),
                                                content: const Text(
                                                    "Are you sure you want to log out?"),
                                                actions: [
                                                  CupertinoDialogAction(
                                                    child: const Text("Yes"),
                                                    onPressed: () {
                                                      UserCredit.signOut();
                                                      Get.offAll(const SignIn());
                                                    },
                                                  ),
                                                  CupertinoDialogAction(
                                                    child: const Text("No"),
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      icon: const Icon(
                                          EneftyIcons.arrow_bottom_outline),
                                      color: Colors.black),
                                ),
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
