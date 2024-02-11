import 'package:bloc/bloc.dart';
import 'package:store/model/product_model.dart';

class CartCubit extends Cubit<List<ProductModel>> {
  CartCubit() : super([]);

  void add(ProductModel product) {
    state.add(product);
    emit(List.from(state));
  }
}