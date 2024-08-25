import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Api.dart';

class AllCategoryServices
{

  Future<List<dynamic>> getAllCategory()async
  {
    List<dynamic> data=await Api().get(url:'https://fakestoreapi.com/products/categories');

    return data;

  }
}