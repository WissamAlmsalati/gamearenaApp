import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/view/detail_product_screen/widget/product_photos.dart';

import '../../cart_list.dart';
import '../../model/product_model.dart';

class DetailScreen extends StatefulWidget {
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
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(widget.title, style: const TextStyle(fontSize: 20)),
          ),
          const SizedBox(
            height: 10,
          ),
          ProductPhotos(image: widget.image),        const SizedBox(
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
                    onPressed: () {
                      try{
                        CartList.cart.add(
                          ProductModel(
                            productName: widget.title,
                            productDescription: widget.description,
                            productPrice: widget.price,
                            productImage: widget.image,
                          ),
                        );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Added to cart'),
                                duration: Duration(seconds: 2),
                              ),
                        );
                      } catch(e){
                        print(e);
                      }

                    },
                    child: Text("Add to cart"),
                )
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  widget.price,
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
