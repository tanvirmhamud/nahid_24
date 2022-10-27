import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nahid_24/Route/push.dart';
import 'package:provider/provider.dart';

import '../../../Provider/homepage.dart';
import '../../../utils/constants/colors.dart';
import 'free_course_sub.dart';

class FreeCoursePage extends StatefulWidget {
  final bool valueHide;
  const FreeCoursePage({Key? key, required this.valueHide}) : super(key: key);

  @override
  State<FreeCoursePage> createState() => _FreeCoursePageState();
}

class _FreeCoursePageState extends State<FreeCoursePage> {
  final classes = {
    'ফ্রি কোর্স': 'HSC_Video_Subject',
    'পেইড কোর্স': 'Admission_Video_Subject',
    'লাইভ ক্লাস': 'Job_Video_Subject',
  };

  bool loading = false;

  Future loaddata() async {
    setState(() {
      loading = true;
    });
    final provider = Provider.of<HomeProvider>(context, listen: false);
    await provider.getfreecourse();
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
                  // Row(
                  //   children: [
                  //     Text(
                  //       "Free Courses",
                  //       style: TextStyle(
                  //           color: Colors.indigo,
                  //           fontSize: 17.sp,
                  //           fontWeight: FontWeight.bold),
                  //     ),
                  //     Spacer(),
                  //     Text(
                  //       "Sell All",
                  //       style: TextStyle(
                  //           color: Colors.indigo,
                  //           fontSize: 17.sp,
                  //           fontWeight: FontWeight.bold),
                  //     )
                  //   ],
                  // ),
                  SizedBox(height: 5.h),
                  Expanded(
                    child: GridView.builder(
                        itemCount: provider.freeCourse!.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.1.r,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h,
                        ),
                        itemBuilder: ((context, index) {
                          var data = provider.freeCourse!.data![index];
                          return InkWell(
                            onTap: () {
                              newscreen(
                                  FreeCourseSubPage(
                                      name: data.name!,
                                      data: data,
                                      valueHide: widget.valueHide),
                                  context);
                              // !valueHide
                              //     ? Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (_) => FreeCourseVideo()))
                              //     : Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (_) => PaidCourse()));
                            },
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.grey[400]!),
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 150.h,
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
                                                decoration: BoxDecoration(
                                                  color: Colors.amber,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0.r),
                                                  // image: DecorationImage(
                                                  //   image: NetworkImage(
                                                  //       data.thumbnail!),
                                                  //   fit: BoxFit.cover,
                                                  // ),
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
                                                    "৳ ৩০০০",
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
                                      SizedBox(height: 10.h),
                                      Center(
                                        child: Text(
                                          data.name!,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      // Center(
                                      //   child: Text(
                                      //     "কে এম রাফসান রাব",
                                      //     style: TextStyle(
                                      //         fontSize: 16.sp,
                                      //         color: Colors.grey),
                                      //   ),
                                      // )
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
