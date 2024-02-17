import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../database_helper.dart';
import '../../../model/product_model.dart';

class GetCollectionData {
  final String collectionName;

  GetCollectionData(this.collectionName);

  Future<QuerySnapshot> getCollectionData() async {
    try {
      return await FirebaseFirestore.instance.collection(collectionName).get();
    } catch (e) {
      print('Error getting collection data: $e');
      throw e;
    }
  }
}

class CollectionsData {
  final deskCollection = GetCollectionData('DeskCat').getCollectionData();
  final gpuCollection = GetCollectionData('gpus').getCollectionData();
  final headphones = GetCollectionData('headphones').getCollectionData();
  final keyboards = GetCollectionData('keyboards').getCollectionData();
  final monitor = GetCollectionData('screens').getCollectionData();
  final mouse = GetCollectionData('mouses').getCollectionData();

  static Future<QuerySnapshot> combineCollections() async {
    final collections = [
      'DeskCat',
      'gpus',
      'headphones',
      'keyboards',
      'screens',
      'mouses',
    ];

    final allProductsRef =
    FirebaseFirestore.instance.collection('AllProducts');

    for (final collection in collections) {
      final data = await GetCollectionData(collection).getCollectionData();
      final documents = data.docs;

      for (final doc in documents) {
        final docData = doc.data();
        if (docData != null && docData is Map<String, dynamic>) {
          final docId = doc.id;
          final existingDoc = await allProductsRef.doc(docId).get();

          if (!existingDoc.exists || existingDoc.data() != docData) {
            await allProductsRef.doc(docId).set(docData);
          }
        }
      }
    }

    return allProductsRef.get();
  }
}
class DataHolder {
  static final DataHolder _singleton = DataHolder._internal();

  factory DataHolder() {
    return _singleton;
  }

  DataHolder._internal();

  QuerySnapshot<Object?>? allProductsData;

  Future<void> fetchData() async {
    await CollectionsData.combineCollections();
    // Assign the fetched data directly to the allProductsData property
    allProductsData = await FirebaseFirestore.instance.collection('AllProducts').get();
  }
}