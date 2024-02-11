import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/view/detail_product_screen/detail_screen.dart';

class CardWidget extends StatelessWidget {
  String productName;
  String productDescription;
  String productPrice;
  String productImage;
  CardWidget(
      {required this.productName,
      required this.productDescription,
      required this.productPrice,
      required this.productImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 7, bottom: 7, left: 10, right: 10),
      height: MediaQuery.of(context).size.height * 0.168,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: GestureDetector(
        onTap: () {
          Get.to(
              () => DetailScreen(
                    title: productName,
                    image: productImage,
                    price: productPrice,
                    description: productDescription,
                  ),
              transition: Transition.fade);
        },
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15),
              height: MediaQuery.of(context).size.height * 0.13,
              width: MediaQuery.of(context).size.width * 0.27,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    productImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    productDescription,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(productPrice,
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  List<Object?> get props =>
      [productName, productDescription, productPrice, productImage];
}
