import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store/model/product_model.dart';
import '../../view/categorys/data/data_from_firebase.dart';

enum ProductStatus { loading, loaded, error }

class ProductState {
  final ProductStatus status;
  final List<ProductModel> products;
  final String message;

  ProductState({required this.status, required this.products, this.message = ''});
}

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductState(status: ProductStatus.loading, products: []));

  void getProductsByCollection(List<String> collectionNames) async {
    emit(ProductState(status: ProductStatus.loading, products: state.products));
    try {
      List<Future<QuerySnapshot>> futures = [];
      for (var collectionName in collectionNames) {
        futures.add(FirebaseFirestore.instance.collection(collectionName).get());
      }
      List<QuerySnapshot> results = await Future.wait(futures);
      List<ProductModel> products = [];
      for (var result in results) {
        products.addAll(result.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList());
      }
      emit(ProductState(status: ProductStatus.loaded, products: products));
    } catch (e) {
      emit(ProductState(status: ProductStatus.error, products: [], message: e.toString()));
    }
  }
}