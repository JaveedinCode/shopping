import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shopping/models/model_class.dart';

Future<List<Products>> getProducts() async {
  const baseUrl = 'https://dummyjson.com/products';

  try {
    final response = await Dio().get(baseUrl);

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['products'];
      final List<Products> products =
          data.map((item) => Products.fromJson(item)).toList();
      return products;
    } else {
      debugPrint('sdad');
    }
  } on DioException catch (e) {
    debugPrint('dasdsad: ${e.message}');
  } catch (e) {
    debugPrint('Failed: $e');
  }
  return [];
}
