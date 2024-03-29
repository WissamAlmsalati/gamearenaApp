import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthTextFilled extends StatelessWidget {
  var controller;
  late String hintText;
  late IconData icon;


  AuthTextFilled({Key? key,  this.controller, required this.hintText, required this.icon, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.grey[300],
          filled: true,
          suffixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hintText:hintText,
        ),
        validator: validateInput,
        autovalidateMode: AutovalidateMode.onUserInteraction,

      ),
    );
  }
  String? validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your $hintText';
    }
    // Add more validation logic if needed
    return null;
  }
}



