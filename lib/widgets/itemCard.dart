import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';

import '../pages/updatePage.dart';

class itemCard extends StatelessWidget {
   itemCard({
    super.key,
    required this.product
  });

  ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(
          context,UpdateProductPage.id,arguments: product
        );      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.grey.withOpacity(.2),
                  )]
            ),
            child: Card(
              elevation: 10,
              shadowColor: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(product.title.substring(0,10),style: const TextStyle(color: Colors.grey,fontSize: 15),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r'$''${product.price.toString()}',style: const TextStyle(color: Colors.black,fontSize: 16)),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.favorite,color: Colors.red,))
                      ],
                    ),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
            ),
          ),
          Positioned(right: 28, bottom:140 ,child: Image.network(product.image,height: 110,width: 100,))
        ],
      ),
    );
  }
}