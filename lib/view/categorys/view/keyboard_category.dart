import 'package:flutter/material.dart';
import 'package:store/model/product_model.dart';
import 'package:store/view/categorys/widget/list_view_product_card.dart';

class KeyBoardCat extends StatelessWidget {
  const KeyBoardCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("KeyBoardCat")),
      body:Expanded(child:CardListView(products: ProductModel.keyboards))
    );
  }
}