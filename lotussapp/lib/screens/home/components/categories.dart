import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../size_config.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/food-svgrepo.svg", "text": "Fresh Food Dairy & Bakery" ,"link":"https://www.lotuss.com/th/shop/own-brand/lotuss-fresh-food" },
      {"icon": "assets/icons/meat-svgrepo.svg", "text": "Meat","link":"https://www.lotuss.com/th/shop/own-brand/lotuss-fresh-food/meat-and-seafood"},
      {"icon": "assets/icons/market-svgrepo.svg", "text": "Dry Grocery","link":"https://www.lotuss.com/th/shop/own-brand/lotuss-fresh-food/easy-to-cook-and-ready-to-eat"},
      {"icon": "assets/icons/baby-svgrepo.svg", "text": "Baby & Kids","link":"https://www.lotuss.com/th/shop/own-brand/cute-care"},
      {"icon": "assets/icons/more-svgrepo.svg", "text": "More","link":"https://www.lotuss.com/th"},
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            link: categories[index]["link"],
            press: () async {
              final Uri _url = Uri.parse("https://pub.dev/packages/url_launcher/example");
              await launchUrl(_url, mode: LaunchMode.externalNonBrowserApplication);
            },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press, required link,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
