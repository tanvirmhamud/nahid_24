import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    Key? key,
    required this.onTap,
    required this.title,
    required this.color,
    this.textColor,
  }) : super(key: key);
  VoidCallback onTap;
  String title;
  Color color;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: TextStyle(fontSize: 18, color: color),
      ),
    );
  }
}
