import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lotussapp/data/ProductModel.dart';


import '../../../constants.dart';
import '../../../size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final ProductData cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.network(cart.mediaGallery[0]['url']!),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: displayDiscountWidget(),
        )
      ],
    );
  }

  List<Widget> displayDiscountWidget() {
    if(cart.priceRange['minimumPrice']['regularPrice']['value'] != cart.priceRange['minimumPrice']['finalPrice']['value']) {
      return hasDiscountWighet();
    } else {
     return hasNotDiscountWighet();
    }
  }

  List<Widget> hasDiscountWighet() {
    return [
      Text(
              cart.name,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text(
              "Price: ${cart.priceRange['minimumPrice']['regularPrice']['value']} \฿",
                style: TextStyle(decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w600, color: kDiscount),
            ),
            SizedBox(height: 10),
            Text(
              "Discount : ${cart.priceRange['minimumPrice']['discount']['amountOff']} \฿",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrice),
            ),
            SizedBox(height: 10),
            Text(
              "Total : ${cart.priceRange['minimumPrice']['finalPrice']['value']} \฿",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
            )
    ];
  }

  List<Widget> hasNotDiscountWighet() {
    return [
      Text(
              cart.name,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text(
              "Total: ${cart.priceRange['minimumPrice']['finalPrice']['value']}\฿",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
            )
    ];
  }
}
