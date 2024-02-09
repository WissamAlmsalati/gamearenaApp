import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/controler/cart_cubit/cubit/cart_cubit.dart';
import 'package:store/model/product_model.dart';
import 'package:store/view/categorys/widget/product_card.dart';

class CartListItems extends StatelessWidget {
  CartListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, List<ProductModel>>(
      builder: (context, cart) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: cart.length,
          itemBuilder: (context, index) {
            var product = cart[index];
            return CardWidget(
              productName: product.name,
              productDescription: product.description,
              productPrice: product.price.toString(),
              productImage: product.image,
            );
          },
        );
      },
    );
  }
}