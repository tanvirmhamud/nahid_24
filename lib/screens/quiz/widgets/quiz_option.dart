import 'package:audioplayers/audioplayers.dart';
import 'package:clean_api/clean_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../getx/selectbtn.dart';

class QuizOption extends StatefulWidget {
  final String optionText;
  final Option<bool> isCorrect;
  QuizOption({Key? key, required this.isCorrect, required this.optionText})
      : super(key: key);

  @override
  State<QuizOption> createState() => _QuizOptionState();
}

class _QuizOptionState extends State<QuizOption> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 2,
              color: widget.isCorrect.match(
                  (t) => t ? Colors.green : Colors.red,
                  () => Colors.blueAccent))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          widget.optionText,
          style: TextStyle(fontSize: 18),
        ),
        Container(
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: widget.isCorrect.match(
                (t) => t
                    ? Icon(
                        Icons.check_circle,
                        size: 30.0,
                        color: Colors.green,
                      )
                    : Icon(
                        CupertinoIcons.clear_thick_circled,
                        size: 30.0,
                        color: Colors.red,
                      ),
                () => Icon(
                      Icons.circle_outlined,
                      size: 30.0,
                    ))),
      ]),
    );
  }
}
