import 'package:flutter/material.dart';
import 'package:store/view/detail_product_screen/widget/product_photos.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final String image;
  final String price;
  final String description;

  DetailScreen(
      {required this.title,
      required this.image,
      required this.price,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(title, style: const TextStyle(fontSize: 20)),
          ),
          const SizedBox(
            height: 10,
          ),
          const ProductPhotos(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: const Text(
              "Product description",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Spacer(),
          Container(
            height: 140,
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
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Add to cart",
                      )),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  price,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
