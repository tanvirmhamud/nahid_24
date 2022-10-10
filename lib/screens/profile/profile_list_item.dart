import 'package:nahid_24/utils/constants/assets.dart';
import 'package:flutter/material.dart';

class ProfileListItem {
  ProfileListItem({required this.title, required this.image, this.screens});

  String title;
  Widget image;

  Widget? screens;
}

List<ProfileListItem> item = [
  ProfileListItem(
    title: "Name",
    image: Image.asset(
      PAssets.person,
      scale: 20,
    ),
  ),
  ProfileListItem(
    title: "Mobile Number",
    image: Image.asset(
      PAssets.phone,
      scale: 20,
    ),
  ),
  ProfileListItem(
    title: "email address",
    image: Image.asset(
      PAssets.message,
      scale: 20,
    ),
  ),
  ProfileListItem(
    title: "Your college/university",
    image: Image.asset(
      PAssets.versity,
      scale: 20,
    ),
  ),
  ProfileListItem(
    title: "Change password",
    image: Image.asset(
      PAssets.lock,
      scale: 20,
    ),
  ),
  ProfileListItem(
    title: "Exam Completed",
    image: Image.asset(
      PAssets.exam_completed,
      scale: 19,
    ),
  ),
  ProfileListItem(
    title: "Model Test Completed",
    image: Image.asset(
      PAssets.exam_completed,
      scale: 19,
    ),
  ),
  ProfileListItem(
    title: "Quiz Completed",
    image: Image.asset(
      PAssets.exam_completed,
      scale: 19,
    ),
  ),
  ProfileListItem(
    title: "Prize Completed",
    image: Image.asset(
      PAssets.exam_completed,
      scale: 19,
    ),
  ),
  ProfileListItem(
    title: "Certificate",
    image: Image.asset(
      PAssets.certificate,
      scale: 20,
    ),
  ),
  ProfileListItem(
    title: "Logout",
    image: Image.asset(
      PAssets.person,
      scale: 20,
    ),
  ),
];
