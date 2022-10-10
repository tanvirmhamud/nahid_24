import 'package:flutter/material.dart';

GlobalKey<NavigatorState>? navKey = GlobalKey();
void push({required Widget screen}) {
  Navigator.push(
    navKey!.currentContext!,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

void pushReplacement({required Widget screen}) {
  Navigator.pushReplacement(
    navKey!.currentContext!,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

void pushAndRemoveUntil({required Widget screen}) {
  Navigator.pushAndRemoveUntil(
      navKey!.currentContext!,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
      (route) => false);
}

void pop() {
  Navigator.pop(
    navKey!.currentContext!,
  );
}

void popWith({required bool value}) {
  Navigator.pop(navKey!.currentContext!, value);
}
