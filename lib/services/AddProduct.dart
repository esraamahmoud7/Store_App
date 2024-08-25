
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:store_app/services/Api.dart';

import '../models/product_model.dart';

class AddProduct
{
  Future<ProductModel> addProduct({required int id,required String title,required String price,required String desc,required String image,required String category})async
  {

    Map<String,dynamic> data = await Api().post(url: 'https://fakestoreapi.com/products', Body:
        {
          'id': id,
          'title': title,
          'price': price,
          'description': desc,
          'image': image,
          'category': category
        });

    return ProductModel.fromJson(data);
  }
}