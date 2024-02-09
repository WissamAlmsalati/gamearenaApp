import 'package:flutter/material.dart';
import 'package:store/model/product_model.dart';
import 'package:store/view/categorys/widget/list_view_product_card.dart';

class DeskCat extends StatelessWidget {
  const DeskCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("DeskCat")),
      body: Expanded(child:CardListView(products: ProductModel.desks))
    );
  }
}
