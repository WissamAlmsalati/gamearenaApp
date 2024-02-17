import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store/model/product_model.dart';
import 'package:store/view/categorys/widget/list_view_product_card.dart';
import '../data/data_from_firebase.dart';

class DeskCat extends StatelessWidget {
  const DeskCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = CollectionsData().deskCollection;
    return Scaffold(
      appBar: AppBar(title:const Text("DeskCat")),
      body: FutureBuilder<QuerySnapshot>(
        future: data,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            if (snapshot.data!.docs.isEmpty) {
              return Center(child: Text('No data available'));
            } else {
              // Convert each DocumentSnapshot to ProductModel
              final products = snapshot.data!.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
              return Expanded(child: CardListView(products: products));
            }
          }
        },
      ),
    );
  }
}
