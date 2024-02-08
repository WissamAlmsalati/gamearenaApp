import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../images.dart';

class CoustomAppBar extends StatelessWidget {
  const CoustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.08,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
          image: AssetImage(Images.appLogo),
          fit: BoxFit.contain,

      ),
    ),
            width: 50,
            height: 50,
          ),
          const Spacer(),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications), color: Colors.black),
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu),
              color: Colors.black
            ),
          ),
        ],
      ),
    );
  }
}