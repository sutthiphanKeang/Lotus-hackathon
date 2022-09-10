

import 'ProductModel.dart';

class CartSingleton {
  final List<Product> _products = [];

  CartSingleton._();
  static final instance = CartSingleton._();

  List<Product> get products {
    return _products;
  }
}