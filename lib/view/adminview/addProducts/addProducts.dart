import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../../../services/adminServices/addProductToColloction.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  String? _selectedCategory;

  List<String> _categories = ['screens', 'headphones', 'mouses', 'keyboards'];

  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  String? _productName;
  String? _productPrice;
  String? _productDescription;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate() && _imageFile != null && _selectedCategory != null) {
      _formKey.currentState!.save();
      try {
        String imageUrl = await AdminAddProduct.uploadImageToFirebase(_imageFile!);
        await AdminAddProduct.addProductToCollection(
          _selectedCategory!,
          _productName!,
          _productPrice!,
          _productDescription!,
          imageUrl,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Product added successfully.'),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error adding product: $e'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: InputDecoration(labelText: 'Product Category'),
              items: _categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
              validator: (value) =>
              value == null ? 'Please select a category.' : null,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Product Name'),
              validator: (value) =>
              value!.isEmpty ? 'Please enter a product name.' : null,
              onSaved: (value) => _productName = value,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Product Price'),
              validator: (value) =>
              value!.isEmpty ? 'Please enter a product price.' : null,
              onSaved: (value) => _productPrice = value,
            ),
            TextFormField(
              decoration:
              InputDecoration(labelText: 'Product Description'),
              validator: (value) =>
              value!.isEmpty ? 'Please enter a product description.' : null,
              onSaved: (value) => _productDescription = value,
            ),
            if (_imageFile != null) Image.file(_imageFile!),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            ElevatedButton(
              onPressed: _submit,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
