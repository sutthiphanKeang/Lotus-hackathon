

import 'package:lotussapp/data/ProductModel.dart';
import 'package:get/get.dart';


class CartSingleton {
  final RxList<ProductData> _products = <ProductData>[].obs;

  CartSingleton._();
  static final instance = CartSingleton._();

  List<ProductData> get products {
    return _products;
  }
}