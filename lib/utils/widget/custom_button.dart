import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.onTap,
    this.title,
    this.color,
    this.border,
  });
  VoidCallback? onTap;
  String? title;
  Color? color;
  BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          title!,
          style: TextStyle(fontSize: 18, color: color),
        ),
      ),
    );
  }
}
