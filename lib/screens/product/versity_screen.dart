import 'package:nahid_24/utils/constants/colors.dart';
import 'package:nahid_24/utils/widget/submit_button.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> versity = [
    "ঢাকা বিশ্ববিদ্যালয়",
    "রাজশাহী বিশ্ববিদ্যালয়",
    "চট্টগ্রাম বিশ্ববিদ্যালয়",
    "গুচ্ছ ভর্তি পরীক্ষা"
  ];

  Color clrs = Colors.yellow;
  bool istap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Versity"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: versity.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 25,
                            decoration: BoxDecoration(
                                color: PColor.containerColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              versity[index],
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SumitButton(
                                      width: 150,
                                      height: 20,
                                      radius: 20,
                                      onTap: () {},
                                      title: "ক ইউনিট",
                                      textColor: PColor.textColor2,
                                      textFontWeight: FontWeight.bold,
                                      color: PColor.textfieldColor,
                                    ),
                                    SumitButton(
                                      width: 150,
                                      height: 20,
                                      radius: 20,
                                      onTap: () {},
                                      title: "খ ইউনিট",
                                      textColor: PColor.textColor2,
                                      textFontWeight: FontWeight.bold,
                                      color: PColor.textfieldColor,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SumitButton(
                                      width: 150,
                                      height: 20,
                                      radius: 20,
                                      onTap: () {},
                                      title: "গ ইউনিট",
                                      textColor: PColor.textColor2,
                                      textFontWeight: FontWeight.bold,
                                      color: PColor.textfieldColor,
                                    ),
                                    SumitButton(
                                      width: 150,
                                      height: 20,
                                      radius: 20,
                                      onTap: () {},
                                      title: "ঘ ইউনিট",
                                      textColor: PColor.textColor2,
                                      textFontWeight: FontWeight.bold,
                                      color: PColor.textfieldColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ));
  }
}
