import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AdminAddProduct {
  static Future<void> addProductToCollection(String productName, String productPrice, String productDescription, String imageUrl) async {
    try {
      // Add product data to Firestore
      await FirebaseFirestore.instance.collection('products').add({
        'productName': productName,
        'productPrice': productPrice,
        'productDescription': productDescription,
        'productImage': imageUrl,
      });

      print('Product added successfully.');
    } catch (e) {
      print('Error adding product: $e');
      // Throw the error again to handle it in the calling code if needed
      throw e;
    }
  }

  static Future<String> uploadImageToFirebase(File file) async {
    try {
      // Generate a unique filename for the image
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      // Reference to the location where the image will be saved in Firebase Storage
      Reference storageReference = FirebaseStorage.instance.ref().child('product_images/$fileName');
      // Upload the image file to Firebase Storage
      await storageReference.putFile(file);
      // Get the download URL for the uploaded image
      String imageUrl = await storageReference.getDownloadURL();
      print('Image uploaded successfully. URL: $imageUrl');
      return imageUrl;
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      throw e;
    }
  }
}