import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/view/cart_screen/widget/cart_items.dart';

import '../../cart_list.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      String total = CartList.cart.fold(
          "0",
          (previousValue, element) =>
              (int.parse(previousValue) + int.parse(element.productPrice))
                  .toString());


    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: CartList.cart.length,
                itemBuilder: (context, index) {
                  return CartListItems(
                    productName: CartList.cart[index].productName,
                    productDescription: CartList.cart[index].productDescription,
                    productPrice: CartList.cart[index].productPrice,
                    productImage: CartList.cart[index].productImage,
                  );
                },
              ),
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Total Price",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        total.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
