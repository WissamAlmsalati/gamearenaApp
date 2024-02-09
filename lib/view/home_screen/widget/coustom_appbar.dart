import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../images.dart';

class CoustomAppBar extends StatelessWidget {
  const CoustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(
              Images.textLogo,
              width: MediaQuery.of(context).size.width * 0.58,
            ),
          ),
          Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications),
              color: Colors.black),
          Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu),
                color: Colors.black),
          ),
        ],
      ),
    );
  }
}
