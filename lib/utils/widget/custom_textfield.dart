import 'package:nahid_24/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.title,
      required this.controller,
      required this.image,
      required this.obscureText})
      : super(key: key);
  String title;
  String image;
  bool obscureText = false;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        decoration: BoxDecoration(
            color: PColor.textfieldColor,
            borderRadius: BorderRadius.circular(10)),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: title,
            prefixIcon: Container(
              height: 50,
              width: 50,
              child: Image.asset(
                image,
                scale: 14,
              ),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
