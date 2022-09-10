import 'dart:convert';
import 'package:flutter/cupertino.dart';
class Local {
  static Future<String> getProductIdByCode(
      BuildContext context, String code) async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/product_barcode_mapping.json");
    final jsonResult = jsonDecode(data); //latest Dart
    return (jsonResult
            .firstWhere((element) => element["UPC"] == code))["Item_number"] ??
        "";
  }
}