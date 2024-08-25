import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/product_model.dart';
import '../services/get_all_product_services.dart';
import '../widgets/itemCard.dart';


class Homepage extends StatelessWidget {
  const Homepage({super.key});

  static String id="homePage";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.shoppingCart))
        ],
        title:const Text(" New Trend  "),
        centerTitle: true,
      ),
      body:Padding(
        padding: const EdgeInsets.only(top: 50,left: 16,right: 16),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductsService().getAllProducts(),
          builder: (context,snapshot)
          {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                  itemCount: products.length,
                             clipBehavior: Clip.none,
                             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 100,
                             ),
                             itemBuilder: (context, index) {
                               return itemCard(product: products[index]);
                    }
                );
              }
            else
              {
                return const Center(child: CircularProgressIndicator());
              }
          },
        )
      )
    );
  }
}

