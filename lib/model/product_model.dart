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

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'productPrice': productPrice,
      'productDescription': productDescription,
      'productImage': productImage,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productName: map['productName'],
      productPrice: map['productPrice'],
      productDescription: map['productDescription'],
      productImage: map['productImage'],
    );
  }
}