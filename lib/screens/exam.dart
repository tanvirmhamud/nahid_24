import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ModelTestScreen extends StatefulWidget {
  const ModelTestScreen({Key? key}) : super(key: key);

  @override
  State<ModelTestScreen> createState() => _ModelTestScreenState();
}

class _ModelTestScreenState extends State<ModelTestScreen> {
  bool isOpen = false;
  bool isTap = false;
  bool isTap2 = false;
  var bottomSheetController;
  List<String> sImage = ["assets/silder.jpg", "assets/slider2.jpg"];

  List<String> title = [
    "মডেল টেস্ট ১",
    "মডেল টেস্ট 2",
    "মডেল টেস্ট 3",
    "মডেল টেস্ট ৪",
    "মডেল টেস্ট ৫",
    "মডেল টেস্ট ৬",
    "মডেল টেস্ট ৭",
    "মডেল টেস্ট ৮",
    "মডেল টেস্ট ৯",
    "মডেল টেস্ট ১০",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xf045de9).withOpacity(0.7),
        drawer: Container(height: 1000, color: Colors.red, child: Drawer()),
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
                                primary: isTap
                                    ? Color(0xf045de9).withOpacity(0.90)
                                    : Colors.purple),
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
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
