import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthTextFilled extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final IconData icon;
  final TextInputType keyboardType;
  const AuthTextFilled({Key? key,  this.controller, required this.hintText, required this.icon,required this.keyboardType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        keyboardType: keyboardType,
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
      ),
    );
  }
}
