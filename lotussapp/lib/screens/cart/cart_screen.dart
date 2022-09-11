import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../data/Local.dart';
import '../../data/Network.dart';
import '../../data/ProductModel.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';
import '../../data/CartSingleton.dart';


class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null){
      final args = ModalRoute.of(context)!.settings.arguments as String;
      debugPrint('recieved arg! $args');
      getProductByBarcode(context, args);
    }

    return Scaffold(
      appBar: buildAppBar(context),
      body:  Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Obx(() => Text(
            "${CartSingleton.instance.products.length} items",
            style: Theme.of(context).textTheme.caption,
          ),
          )
        ],
      ),
    );
  }

  Future<ProductData> getProductByBarcode(BuildContext context, String barcode) async {
      String sku = await Local.getProductIdByCode(context, barcode);
      if (sku.isEmpty) throw Error();
      ProductData product = await Network.fetchProductBySKU(sku);
     // String name = product.name;

      debugPrint('recieved product! ${product.name}');

      CartSingleton.instance.products.add(product);

      //CartSingleton.instance.products[0].


      return product;
  }
}
