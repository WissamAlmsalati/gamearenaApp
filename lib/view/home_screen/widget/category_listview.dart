import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../catigory_icon.dart';
import '../../categorys/category_screen.dart';

class CoustomListView extends StatelessWidget {
  const CoustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
     child: ListView.builder(
       scrollDirection: Axis.horizontal,
         itemCount: CategoryIcons().icons.length,
         itemBuilder: (context,index)=>Container(
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.circular(10.0),
           ),
           margin: const EdgeInsets.only(right: 16,top: 10,bottom: 10),
           width: 80,
           child: ElevatedButton(
             style: ElevatedButton.styleFrom(
                primary: Colors.white,
               side: BorderSide(color: Colors.black, width: 1),
               elevation: 0,
               shape: RoundedRectangleBorder(

                 borderRadius: BorderRadius.circular(10.0),
               ),
             ),
             onPressed: () {
               Get.to(()=>CategoryScreen(index: index,) );
             },
             child: SvgPicture.asset(
               CategoryIcons().icons[index],
               color: Colors.black,
               height: 40,  // Increased size
               width: 40,  // Increased size
               fit: BoxFit.contain,
             ),
           )
     ),
     ),
    );
  }
}