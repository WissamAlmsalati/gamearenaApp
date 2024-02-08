import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoustomListView extends StatelessWidget {
  const CoustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
     child: ListView.builder(
       scrollDirection: Axis.horizontal,
         itemCount: 8,
         itemBuilder: (context,index)=>Container(
           margin: const EdgeInsets.only(right: 16,top: 10,bottom: 10),
           width: 80,
           color: Colors.deepOrange,
         )
     ),
    );
  }
}
