import 'dart:convert';

import 'package:http/http.dart';

import '../helper/api.dart';
import '../models/product_model.dart';
import 'package:http/http.dart' as http;

class CategoriesSevices {
  Future<List<ProductModel>> getCategoriesProducts(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<ProductModel> productslist = [];
    for (int i = 0; i < data.length; i++) {
      productslist.add(
        ProductModel.fromjson(data[i]),
      );
    }
    return productslist;
  }
}
