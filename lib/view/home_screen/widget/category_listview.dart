import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:store/view/categorys/view/main_catigory_sweches.dart';

import '../../../catigory_icon.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: CategoryIcons().icons.length,
        itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: const EdgeInsets.only(right: 16, top: 10, bottom: 10),
            width: 80,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.black, width: 1),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                Get.to(
                  () => MainCatSwich(
                    index: index,
                  ),
                  transition: Transition.fadeIn,
                );
              },
              child: SvgPicture.asset(
                CategoryIcons().icons[index],
                color: Colors.black,
                height: 40, // Increased size
                width: 40, // Increased size
                fit: BoxFit.contain,
              ),
            )),
      ),
    );
  }
}
