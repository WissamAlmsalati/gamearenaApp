import 'package:flutter/material.dart';
import 'package:store/view/categorys/widget/list_view_product_card.dart';

class MouseCat extends StatelessWidget {
  const MouseCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MouseCat")),
      body:const Expanded(child: CardListView()),
    );
  }
}
