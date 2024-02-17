import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'addProducts/addProducts.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Admin Screen"),
            ElevatedButton(onPressed: (){
              Get.to(()=>AddProductScreen());
            }, child: Text("Add Product")),
            ElevatedButton(onPressed: (){}, child: Text("Add Category")),
            ElevatedButton(onPressed: (){}, child: Text("Add Ads")),
          ],
        ),
      )
    );
  }
}
