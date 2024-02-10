import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('Sign In'),
          ElevatedButton(
            onPressed: () {},
            child: Text("Sign In"),
          ),
        ],
      ),
    );
  }
}
