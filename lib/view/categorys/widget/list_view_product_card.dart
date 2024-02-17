import 'package:flutter/material.dart';
import 'package:store/view/categorys/widget/product_card.dart';

import '../../../model/product_model.dart';

class CardListView extends StatelessWidget {
  final List<ProductModel> products;
  const CardListView({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => CardWidget(
          productName: products[index].productName,
          productDescription: products[index].productDescription,
          productPrice: products[index].productPrice.toString(),
          productImage: products[index].productImage,
        ));
  }
}