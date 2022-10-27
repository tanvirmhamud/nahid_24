import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nahid_24/New_Design/Homepage_design/Free_course/free_course_video.dart';
import '../../utils/constants/colors.dart';

class FreeCourseDetails extends StatefulWidget {
  const FreeCourseDetails({super.key});

  @override
  State<FreeCourseDetails> createState() => _FreeCourseState();
}

class _FreeCourseState extends State<FreeCourseDetails> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: PColor.containerColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Icon(Icons.arrow_back),
        ),
        title: Text(
          'অর্ডার কনফার্মেশন',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Container(
                      padding: EdgeInsets.all(12.r),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 70.sp,
                            width: 70.sp,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6.0.sp),
                              child:
                                  // CachedNetworkImage(
                                  //   imageUrl: icon ?? '',
                                  //   height: 50.sp,
                                  //   width: 50.sp,
                                  //   placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
                                  //   fit: BoxFit.cover,
                                  //   errorWidget: (context, url, error) => Image.asset(
                                  //     'icons/ic_avatar.png',
                                  //     fit: BoxFit.cover,
                                  //   ),
                                  // ),
                                  Image.asset(
                                'assets/images/WhatsApp Image 2022-09-19 at 5.54.28 PM.jpeg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Presentation & Public Speaking",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 19.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Text(
                                  "বিনামূল্যে",
                                  style: TextStyle(
                                    color: PColor.containerColor,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Divider(
                    color: Colors.black38,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'কোর্স মূল্য',
                              style: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'বিনামূল্যে',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 34.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'সর্বমোট',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              '৳0',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(10.r),
                child: MaterialButton(
                    onPressed: () {},
                    // onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (_) => FreeCourseVideo()));  },
                    minWidth: ScreenUtil.defaultSize.width,
                    color: PColor.containerColor,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Continue",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    )),
              ))
        ],
      ),
    ));
  }
}
