import 'package:flutter/material.dart';

class MouseCat extends StatelessWidget {
  const MouseCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MouseCat")),
      body: Center(
        child: Text(" MouseCat"),
      ),
    );
  }
}
