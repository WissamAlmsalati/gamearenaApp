import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String productName;
  final String productPrice;
  final String productDescription;
  final String productImage;

  ProductModel({
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.productImage,
  });

  factory ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    return ProductModel(
      productName: snapshot['productName'],
      productPrice: snapshot['productPrice'],
      productDescription: snapshot['productDescription'],
      productImage: snapshot['productImage'],
    );
  }
}