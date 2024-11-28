import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/cuibts/HomeCubits/home_cubit.dart';
import '../models/product_model.dart';
import '../widgets/itemCard.dart';


class Homepage extends StatelessWidget {
  Homepage({super.key});

  static String id = "homePage";
  List<ProductModel> products=[];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).getData();
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {},
                icon: const Icon(FontAwesomeIcons.shoppingCart))
          ],
          title: const Text(" New Trend  "),
          centerTitle: true,
        ),
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context,state)
            {
              if(state is HomeInitial)
                {
                  BlocProvider.of<HomeCubit>(context).getData();
                }
              if(state is HomeSuccess)
                {
                  products=BlocProvider.of<HomeCubit>(context).products;
                }
            },
            builder: (context,state)
            {
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
        )
    );
  }
}

