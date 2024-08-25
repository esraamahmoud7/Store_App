import 'dart:convert';

import '../models/product_model.dart';
import 'package:http/http.dart' as http;

import 'Api.dart';
class AllProductServices
{

  Future<List<ProductModel>> getProducts({required String categoryName}) async
  {
      List<dynamic> data=await Api().get(url:'https://fakestoreapi.com/products/category/$categoryName');
      List<ProductModel> productsList = [];

      for (int i = 0; i < data.length; i++) {
        ProductModel product = ProductModel.fromJson(data[i]);

        productsList.add(product);
      }

      return productsList;

  }
}