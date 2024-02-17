import 'package:bloc/bloc.dart';
import '../../cart_list.dart';

class CartCubit extends Cubit<bool> {
  CartCubit() : super(false);

  void clearCart() {
    CartList.cart.clear();
    emit(true);
  }
}