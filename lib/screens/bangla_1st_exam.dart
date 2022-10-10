import 'package:carousel_slider/carousel_slider.dart';
import 'package:nahid_24/widget/custom_expanded.dart';
import 'package:flutter/material.dart';

class Bangla1stExam extends StatefulWidget {
  const Bangla1stExam({Key? key}) : super(key: key);

  @override
  State<Bangla1stExam> createState() => _Bangla1stExamState();
}

class _Bangla1stExamState extends State<Bangla1stExam> {
  int selectedCard = -1;
  bool isOpen = false;
  bool isTap = false;
  bool isTap2 = false;
  var bottomSheetController;
  List<String> sImage = ["assets/silder.jpg", "assets/slider2.jpg"];

  List<String> dot = [
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
    ".........",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xf045de9).withOpacity(0.7),
      drawer: Container(height: 1000, color: Colors.white, child: Drawer()),
      appBar: AppBar(
        backgroundColor: Color(0xf045de9).withOpacity(0.7),
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                size: 32,
              ));
        }),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Container(
                child: Image.asset(
                  "assets/cart.png",
                ),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 120,
              child: CarouselSlider(
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    initialPage: 0,
                    enlargeCenterPage: true,
                    viewportFraction: 0.85,
                  ),
                  items: List<Widget>.generate(
                      2, (index) => Image.asset(sImage[index % 2]))),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 30,
                        width: 110,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "এইচ এস সি",
                            style: TextStyle(fontSize: 14),
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              primary: Color(0xf045de9).withOpacity(0.90)),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 110,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("ভর্তি প্রস্তুতি"),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              primary: Color(0xf045de9).withOpacity(0.90)),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 110,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "চাকরি প্রস্তুতি",
                            style: TextStyle(fontSize: 13),
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              primary: Color(0xf045de9).withOpacity(0.90)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 30,
                        width: 110,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "পরীক্ষা",
                            style: TextStyle(fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              primary: Color(0xf045de9).withOpacity(0.90)),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 110,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("মডেল টেস্ট"),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              primary: Color(0xf045de9).withOpacity(0.90)),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 110,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "কুইজ",
                            style: TextStyle(fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              primary: Color(0xf045de9).withOpacity(0.90)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            CustomExpanded(title: dot)
          ],
        ),
      ),
    );
  }
}
