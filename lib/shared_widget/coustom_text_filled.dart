import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Constants/constans.dart';

class CustomTextFilled extends StatelessWidget {
  String? hintText;
  Icon? icon;
  TextEditingController? controller;

   CustomTextFilled({this.hintText,this.icon, required controller });

  @override
  Widget build(BuildContext context) {
    AppDimension appDimension = AppDimension(context);
    return Container(
      height: appDimension.height * 0.07,
      width: appDimension.width * 0.96,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3.0,
            blurRadius: 5.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              fillColor: Colors.white,
              suffixIcon: icon,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
