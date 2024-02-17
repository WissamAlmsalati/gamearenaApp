import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewAllProductsScreen extends StatefulWidget {
  const ViewAllProductsScreen({super.key});

  @override
  _ViewAllProductsScreenState createState() => _ViewAllProductsScreenState();
}

class _ViewAllProductsScreenState extends State<ViewAllProductsScreen> {
  late Future<QuerySnapshot> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = FirebaseFirestore.instance.collection('products').get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View All Products'),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: _productsFuture,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView(
              padding: EdgeInsets.all(16.0),
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                return ListTile(
                  title: Text('Product Name: ${data['productName']}'),
                  subtitle: Text('Product Price: ${data['productPrice']}'),
                  trailing: Image.network(data['productImage']),
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}