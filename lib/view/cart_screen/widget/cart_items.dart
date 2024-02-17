import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/model/product_model.dart';
import 'package:store/view/categorys/widget/product_card.dart';

import '../../../cart_list.dart';

class CartListItems extends StatelessWidget {
  final String productName;
  final String productDescription;
  final String productPrice;
  final String productImage;

  CartListItems({
    Key? key,
    required this.productImage,
    required this.productPrice,
    required this.productDescription,
    required this.productName
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      productName: productName,
      productDescription: productDescription,
      productPrice: productPrice,
      productImage: productImage,
    );
  }
}