

import 'package:lotussapp/data/ProductModel.dart';



class CartSingleton {
  final List<ProductData> _products = [];

  CartSingleton._();
  static final instance = CartSingleton._();

  List<ProductData> get products {
    return _products;
  }
}