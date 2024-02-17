import 'package:store/model/product_model.dart';
class CartList {
 static List<ProductModel> cart = [];
  void add(ProductModel product) {
    cart.add(product);
  }
}
