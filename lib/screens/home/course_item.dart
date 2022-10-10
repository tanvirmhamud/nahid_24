import 'package:flutter/cupertino.dart';

class CourseItem {
  CourseItem({required this.coursesPhoto});

  Widget coursesPhoto;
}

List<CourseItem> coursesItems = [
  CourseItem(
    coursesPhoto: Image.asset(
      "assets/1.png",
      fit: BoxFit.cover,
    ),
  ),
  CourseItem(
    coursesPhoto: Image.asset(
      "assets/2.png",
      fit: BoxFit.cover,
    ),
  ),
  CourseItem(
    coursesPhoto: Image.asset(
      "assets/3.png",
      fit: BoxFit.cover,
    ),
  ),
  CourseItem(
    coursesPhoto: Image.asset(
      "assets/4.png",
      fit: BoxFit.cover,
    ),
  ),
  CourseItem(
    coursesPhoto: Image.asset(
      "assets/5.png",
      fit: BoxFit.cover,
    ),
  ),
  CourseItem(
    coursesPhoto: Image.asset(
      "assets/6.png",
      fit: BoxFit.cover,
    ),
  ),
  CourseItem(
    coursesPhoto: Image.asset(
      "assets/7.png",
      fit: BoxFit.cover,
    ),
  ),
  CourseItem(
    coursesPhoto: Image.asset(
      "assets/8.png",
      fit: BoxFit.cover,
    ),
  ),
  CourseItem(
    coursesPhoto: Image.asset(
      "assets/9.png",
      fit: BoxFit.cover,
    ),
  ),
];
