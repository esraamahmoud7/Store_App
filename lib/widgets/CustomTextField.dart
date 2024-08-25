import 'package:flutter/material.dart';


class CustTextField extends StatelessWidget {
  CustTextField({super.key,required this.hint,required this.onChanged,required this.type});
  String hint;

  Function(String) onChanged;
  TextInputType type;
  // bool invisible;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: type,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        enabledBorder: OutlineInputBorder(borderSide: BorderSide( color: Colors.black,),borderRadius: BorderRadius.circular(8)),
        border: OutlineInputBorder(borderSide: BorderSide( color: Colors.black,),borderRadius: BorderRadius.circular(8)),

      ),
    );
  }
}