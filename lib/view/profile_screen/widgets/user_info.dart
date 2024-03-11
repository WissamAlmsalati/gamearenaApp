import 'package:flutter/material.dart';

class UserInfoView extends StatelessWidget {
final String userName;
final String phoneNumber;
  const UserInfoView({super.key, required this.userName, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return           Column(
      children: [
        const CircleAvatar(
          
          radius: 50,
          backgroundImage:
          NetworkImage('https://source.unsplash.com/random'),
        ),
        Text(userName), // Display the user's name here
        Text(phoneNumber),
        const Text("Location"),
      ],
    );
  }
}
