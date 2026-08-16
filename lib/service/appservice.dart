import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:responsive_app/model/product_model.dart';

class Appservice {
  static const String baseUrl = 'https://api.escuelajs.co/api/v1/products';
  static const String categoryUrl =
      'https://api.escuelajs.co/api/v1/categories';
  static Future<List<ProductModel>> featch_all_products() async {
    final resbonse = await http.get(Uri.parse(baseUrl));
    if (resbonse.statusCode == 200) {
      final List<dynamic> data = jsonDecode(resbonse.body);
      List<ProductModel> dat = data.map((item) {
        try {
          return ProductModel.fromJson(item);
        } catch (e) {
          print('////////////////there is an error////////////////');
          print(item);
          print('///////////////////$e////////////////////');
          throw Exception('Failed to parse product data: $e');
        }
      }).toList();
      return dat;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<ProductModel> featch_product_by_id(int id) async {
    final resbonse = await http.get(Uri.parse('$baseUrl/$id'));
    if (resbonse.statusCode == 200) {
      final data = jsonDecode(resbonse.body);
      return ProductModel.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<List<String>> featch_all_categories() async {
    final resbonse = await http.get(Uri.parse(categoryUrl));
    if (resbonse.statusCode == 200) {
      final List<dynamic> data = jsonDecode(resbonse.body);
      return data.map((item) => item['name'] as String).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
