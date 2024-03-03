import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:store/view/detail_product_screen/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  Future<QuerySnapshot> performSearch() {
    return FirebaseFirestore.instance
        .collection('AllProducts')
        .where('productName', isEqualTo: searchController.text)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: searchController,
                onSubmitted: (value) async {
                  await performSearch();
                  setState(() {});
                },
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<QuerySnapshot>(
                future: performSearch(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(child: Text('No results found'));
                  } else {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        children: snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                          return GestureDetector(
                            onTap: (){
                              Get.to(() => DetailScreen(
  title: data['productName'],
  image: data['productImage'],
  price: data['productPrice'],
  description: data['productDescription'],
));
                            },
                            child: Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(

                                        child: Image.network(data['productImage'])),
                                  ),
                                  Column(
                                    children: [
                                      Text(data['productName']),
                                      Text(data['productDescription']),
                                    ],
                                  ),
                                ],
                              ),

                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
