import 'package:flutter/material.dart';

class SumitButton extends StatelessWidget {
  SumitButton({
    Key? key,
    required this.width,
    required this.height,
    required this.radius,
    required this.onTap,
    required this.title,
    required this.color,
    this.textColor,
    this.textFontWeight,
  }) : super(key: key);
  double width;
  double height;
  double radius;
  VoidCallback onTap;
  String title;
  Color color;
  Color? textColor;
  FontWeight? textFontWeight;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          onPressed: onTap,
          child: Text(
            title,
            style: TextStyle(color: textColor, fontWeight: textFontWeight),
          ),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              primary: color),
        ),
      ),
    );
  }
}
