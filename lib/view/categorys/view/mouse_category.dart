import 'package:flutter/material.dart';
import 'package:store/model/product_model.dart';
import 'package:store/view/categorys/widget/list_view_product_card.dart';

class MouseCat extends StatelessWidget {
  MouseCat({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MouseCat")),
      body: Expanded(child: CardListView(products: ProductModel.mouses)),
    );
  }
}
