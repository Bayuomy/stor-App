import 'dart:convert';

import 'package:http/http.dart';

import '../helper/api.dart';
import '../models/product_model.dart';
import 'package:http/http.dart' as http;

class AllCategoriesServices {
  Future<List<dynamic>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

    return data;
  }
}
