 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cuibts/HomeCubits/home_cubit.dart';
import 'package:store_app/pages/homePage.dart';
import 'package:store_app/pages/updatePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>HomeCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          Homepage.id : (context) => Homepage(),
          UpdateProductPage.id : (context) => UpdateProductPage(),
        },
        initialRoute: Homepage.id,
      ),
    );
  }

}
