import 'package:nahid_24/utils/constants/colors.dart';
import 'package:nahid_24/utils/widget/submit_button.dart';
import 'package:flutter/material.dart';

class Check extends StatefulWidget {
  const Check({Key? key}) : super(key: key);

  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> {
  List<String> quize = [
    "কুইজ  ১",
    "কুইজ  ২",
    "কুইজ  ৩",
    "কুইজ  ৪",
    "কুইজ  ৫",
    "কুইজ  ৬",
    "কুইজ  ৭",
    "কুইজ  ৮",
    "কুইজ  ৯",
    "কুইজ  ১০",
    "কুইজ  ১",
    "কুইজ  ২",
    "কুইজ  ৩",
    "কুইজ  ৪",
    "কুইজ  ৫",
    "কুইজ  ৬",
    "কুইজ  ৭",
    "কুইজ  ৮",
    "কুইজ  ৯",
    "কুইজ  ১০",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: 300,
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SumitButton(
                      width: 110,
                      height: 30,
                      radius: 20,
                      onTap: () {
                        customBottomSheet(context);
                      },
                      title: "abc",
                      color: PColor.containerColor),
                  SumitButton(
                      width: 110,
                      height: 30,
                      radius: 20,
                      onTap: () {},
                      title: "def",
                      color: PColor.containerColor),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  customBottomSheet(
    BuildContext context,
  ) {
    showBottomSheet(
        context: context,
        builder: (context) => Container(
              width: 100,
              height: 100,
              color: Colors.black,
            ));
  }
}
