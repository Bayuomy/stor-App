import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFild extends StatelessWidget {
  CustomTextFild(
      {required this.hinttext,
      required this.obscureText,
      this.onChanged,
      this.inputType});
  Function(String)? onChanged;
  String hinttext;
  bool obscureText;
  TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hinttext,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.circular(16)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
    );
  }
}
