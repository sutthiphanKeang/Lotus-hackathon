import 'package:flutter/material.dart';
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
          children: [
            Text(
              cart.name,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text(
              "${cart.priceRange['minimumPrice']['finalPrice']['value']}\฿",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
            )
          ],
        )
      ],
    );
  }
}
