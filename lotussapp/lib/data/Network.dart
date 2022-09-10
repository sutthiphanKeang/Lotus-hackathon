import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'ProductModel.dart';
class Network {
  static Future<ProductData> fetchProductBySKU(String sku) async {
    //16576918 coke
    final response = await http.get(
        Uri.parse(
            'https://ppe-api.lotuss.com/proc/product/api/v1/products/details?websiteCode=thailand_hy&sku=$sku'),
        headers: {
          HttpHeaders.authorizationHeader:
              'Basic ZDgzNWI1OTMyY2QyNGEyNTg5ZTAzZWVjZmNkYTg5NjA6YzUxMEVEMEJkZDNjNDBhMkFDMzViOGI1ODY4OGIyMTg=',
          'accept-language': 'en'
        });
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ProductData.fromJson(jsonDecode(response.body)['data']);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}