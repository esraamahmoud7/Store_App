import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key,required this.text,required this.OnTap});

  String text;
  VoidCallback?  OnTap;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        width: 420,
        height: 50,
        child: Center(child: Text(text,style: TextStyle(fontSize: 20,color: Colors.white),)),
      ),
    );
  }

}