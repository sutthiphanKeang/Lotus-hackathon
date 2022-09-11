import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lotussapp/components/default_button.dart';

import '../../../constants.dart';
import '../../../data/CartSingleton.dart';
import '../../../size_config.dart';
import '../../home/home_screen.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

double getRegularPrice(){
  List product = CartSingleton.instance.products;
  double price = 0;
  product.forEach((element) {price+=element.priceRange['minimumPrice']['regularPrice']['value'];});

  return price;
}

double getFinalPrice(){
  List product = CartSingleton.instance.products;
  double price = 0;
  product.forEach((element) {price+=element.priceRange['minimumPrice']['finalPrice']['value'];});

  return price;
}
  @override
  Widget build(BuildContext context) {
    return Obx(() =>Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                Text("Add voucher code"),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text: "${getRegularPrice()} \฿",
                        style: TextStyle(decoration: TextDecoration.lineThrough,fontWeight: FontWeight.w800, fontSize: 16, color: kDiscount),
                      ),
                      TextSpan(
                        text: "    ${getFinalPrice()} \฿",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: kPrimaryColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    text: "Check Out",
                    press: () => Navigator.pushNamed(context, HomeScreen.routeName),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
