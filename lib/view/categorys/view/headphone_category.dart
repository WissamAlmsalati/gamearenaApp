import 'package:flutter/material.dart';
import 'package:store/view/categorys/widget/list_view_product_card.dart';

class HeadPhoneCat extends StatelessWidget {
  const HeadPhoneCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HeadPhoneCat")),
      body:const Expanded(child: CardListView()),
    );
  }
}
