import 'package:flutter/material.dart';

class DeskCat extends StatelessWidget {
  const DeskCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DeskCat")),
      body: Center(
        child: Text(" DeskCat"),
      ),
    );
  }
}
