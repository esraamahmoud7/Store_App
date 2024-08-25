

import 'package:store_app/services/Api.dart';

import '../models/product_model.dart';

class UpdateProductService
{
  Future<ProductModel> Updateproduct({required int id,required String title,required String price,required String desc,required String image,required String category})async
  {
    print('product id  = $id');

    Map<String,dynamic> data =await Api().put(Url: 'https://fakestoreapi.com/products/$id', Body: {

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