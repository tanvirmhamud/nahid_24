import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nahid_24/utils/constants/colors.dart';

import '../../Http/Slider/slider.dart';

class MyLiveClassPage extends StatefulWidget {
  const MyLiveClassPage({super.key});

  @override
  State<MyLiveClassPage> createState() => _MyLiveClassPageState();
}

class _MyLiveClassPageState extends State<MyLiveClassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PColor.containerColor,
        title: Text("My Live Class"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          color: PColor.containerColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Text(
                                        "Details",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          color: PColor.containerColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Text(
                                        "Recorded Class",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          color: PColor.containerColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Text(
                                        "Join Class",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                  ],
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
