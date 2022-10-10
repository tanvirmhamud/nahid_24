import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nahid_24/utils/constants/colors.dart';

import '../../Http/Slider/slider.dart';

class MyCoursespage extends StatefulWidget {
  const MyCoursespage({super.key});

  @override
  State<MyCoursespage> createState() => _MyCoursespageState();
}

class _MyCoursespageState extends State<MyCoursespage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PColor.containerColor,
        title: Text("My Course"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<dynamic>(
                future: HttpSlider().getslider(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    return Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 120,
                      child: CarouselSlider(
                          options: CarouselOptions(
                              autoPlayInterval: Duration(seconds: 10),
                              viewportFraction: 1.0,
                              enableInfiniteScroll: false,
                              initialPage: 0,
                              aspectRatio: 0.0,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              height: 120),
                          items: List<Widget>.generate(
                              snapshot.data['data'].length,
                              (index) => Image.network(
                                    snapshot.data['data'][index]['img'],
                                    fit: BoxFit.cover,
                                  ))),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: ((context, index) {
                  return Card(
                    child: Container(
                      height: 100,
                      child: Row(
                        children: [
                          Container(
                            height: 90,
                            margin: EdgeInsets.all(5),
                            width: 90,
                            decoration: BoxDecoration(
                                color: PColor.containerColor,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    "industry. Lorem Ipsum has been the industry's standard"),
                                SizedBox(height: 10),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      color:  PColor.containerColor,
                                      borderRadius: BorderRadius.circular(5.r)),
                                  child: Text(
                                    "Enter",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })),
          ],
        ),
      ),
    );
  }
}
