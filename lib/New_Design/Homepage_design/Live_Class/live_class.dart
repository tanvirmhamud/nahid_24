import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nahid_24/New_Design/Homepage_design/Paid_course/paid_course_details.dart';
import 'package:nahid_24/constant.dart';
import 'package:provider/provider.dart';

import '../../../Provider/homepage.dart';

import '../../../utils/constants/colors.dart';
import 'live_class_details.dart';

class LiveClassspage extends StatefulWidget {
  final bool valueHide;
  const LiveClassspage({Key? key, required this.valueHide}) : super(key: key);

  @override
  State<LiveClassspage> createState() => _LiveClassspageState();
}

class _LiveClassspageState extends State<LiveClassspage> {
  bool loading = false;

  Future loaddata() async {
    setState(() {
      loading = true;
    });
    final provider = Provider.of<HomeProvider>(context, listen: false);
    await provider.getliveclass();
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    loaddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Free Course"),
      // ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              color: Colors.white,
              child: Column(
                children: [
                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  //   decoration: BoxDecoration(
                  //       color: Colors.indigo,
                  //       borderRadius: BorderRadius.circular(5.r)),
                  //   child: Text(
                  //     "Live Class",
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  // ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Text(
                        "লাইভ ক্লাস",
                        style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      // Text(
                      //   "Sell All",
                      //   style: TextStyle(
                      //       color: Colors.indigo,
                      //       fontSize: 17.sp,
                      //       fontWeight: FontWeight.bold),
                      // )

                      Image.asset("assets/youtube1.png", height: 30.h)
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Expanded(
                    child: GridView.builder(
                        itemCount: provider.liveClass!.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .90.r,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h,
                        ),
                        itemBuilder: ((context, index) {
                          var data = provider.liveClass!.data![index];
                          return InkWell(
                            onTap: () {
                              // !valueHide
                              //     ? Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (_) => FreeCourseVideo()))
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => LiveClassDetails(
                                            liveclassid: data.id.toString(),
                                            couresename: data.className!,
                                          )));
                            },
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:
                                          Border.all(color: Colors.grey[400]!),
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 180.h,
                                        width: double.infinity,
                                        margin: EdgeInsets.only(
                                            left: 10.w, right: 10.w, top: 10.h),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        // child: ClipRRect(
                                        //   borderRadius: BorderRadius.circular(10.r),
                                        //   child: Image.asset(
                                        //     "assets/images/WhatsApp Image 2022-09-19 at 5.54.28 PM.jpeg",
                                        //     fit: BoxFit.cover,
                                        //   ),
                                        // ),
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              child: Container(
                                                height: 180.h,
                                                child: Image.network(
                                                  "$imageurl${data.image}",
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                            ),
                                            Visibility(
                                              visible: widget.valueHide,
                                              child: Positioned(
                                                right: -8.0.w,
                                                bottom: 10.0.h,
                                                child: Container(
                                                  height: 25.0.h,
                                                  width: 70.0.w,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: PColor
                                                        .submitButtonColorBlue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0.r),
                                                  ),
                                                  child: Text(
                                                    "৳ ${data.price}",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 7.h),
                                      Center(
                                        child: Text(
                                          data.className!,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20.sp),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          data.instructors!,
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.grey),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                // Positioned(
                                //   top: 90.h,
                                //   right: 0.w,
                                //   child: Container(
                                //     padding:
                                //         EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                //     decoration: BoxDecoration(
                                //         color: Colors.green,
                                //         borderRadius: BorderRadius.circular(10)),
                                //     child: Text(
                                //       "৳ 3000",
                                //       style:
                                //           TextStyle(color: Colors.white, fontSize: 14.sp),
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                          );
                        })),
                  ),
                ],
              ),
            ),
    );
  }
}
