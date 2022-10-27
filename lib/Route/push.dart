import 'package:flutter/material.dart';

void newscreen(Widget screename, BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: ((context) => screename)));
}
