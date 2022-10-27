import 'package:flutter/material.dart';

class QuizeButton {
  QuizeButton({
    required this.title,
    required this.icon,
  });

  String title;
  Widget icon;
}

List<QuizeButton> button_item = [
  QuizeButton(title: "Quiz Again", icon: Icon(Icons.repeat)),
  QuizeButton(title: "Review Answer", icon: Icon(Icons.repeat)),
  QuizeButton(title: "Share Score", icon: Icon(Icons.share)),
  QuizeButton(title: "Generate PDF", icon: Icon(Icons.repeat)),
  QuizeButton(title: "Leaderboard", icon: Icon(Icons.leaderboard)),
  QuizeButton(title: "Home", icon: Icon(Icons.home)),
];
