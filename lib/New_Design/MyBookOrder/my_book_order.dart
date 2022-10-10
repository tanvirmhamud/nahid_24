import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Http/Slider/slider.dart';
import '../../utils/constants/colors.dart';

class MyBookOrder extends StatefulWidget {
  const MyBookOrder({super.key});

  @override
  State<MyBookOrder> createState() => _MyBookOrderState();
}

class _MyBookOrderState extends State<MyBookOrder> {

  var list1 = ['Order ID', 'Receipt', 'Status','401','Click Here','Delivered','402','Click Here','Delivered','403','Click Here','Delivered'];
  var list2= ['Order ID', 'Receipt', 'Status','PC401','Click Here','Delivered','PC402','Click Here','Delivered','PC403','Click Here','Delivered'];
  var list3= ['Order ID', 'Receipt', 'Status','LC401','Click Here','Delivered','LC402','Click Here','Delivered','LC403','Click Here','Delivered'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: PColor.containerColor,

      ),
      body: Container(
        color: PColor.containerColor,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          color: Colors.white,
          child: SingleChildScrollView(
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
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  width: ScreenUtil.defaultSize.width.sw,
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  padding: EdgeInsets.symmetric( vertical: 10.0.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: PColor.submitButtonColorBlue,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Text(
                    "My Books Order",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.w),
                  child: GridView.builder(
                    itemCount: list1.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(4.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 3.0,

                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,),
                    itemBuilder: (BuildContext context, int index) {
                      return    index < 3 ? Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),
                        color: PColor.containerColor,
                        child:  Text(
                          list1[index],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp),
                        ),
                      ):Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: PColor.containerColor)),

                        padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),

                        child:  Text(
                          list1[index],
                          style: TextStyle(
                              color: PColor.containerColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp),
                        ),
                      );
                    },
                  ),
                ),




                SizedBox(
                  height: 15.h,
                ),
                Container(
                  width: ScreenUtil.defaultSize.width.sw,
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  padding: EdgeInsets.symmetric( vertical: 10.0.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: PColor.submitButtonColorBlue,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Text(
                    "My Paid Course Order",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.w),
                  child: GridView.builder(
                    itemCount: list2.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(4.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 3.0,

                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,),
                    itemBuilder: (BuildContext context, int index) {
                      return    index < 3 ? Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),
                        color: PColor.containerColor,
                        child:  Text(
                          list2[index],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp),
                        ),
                      ):Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: PColor.containerColor)),

                        padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),

                        child:  Text(
                          list2[index],
                          style: TextStyle(
                              color: PColor.containerColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp),
                        ),
                      );
                    },
                  ),
                ),



                SizedBox(
                  height: 15.h,
                ),
                Container(
                  width: ScreenUtil.defaultSize.width.sw,
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  padding: EdgeInsets.symmetric( vertical: 10.0.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: PColor.submitButtonColorBlue,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Text(
                    "My Live Course Order",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.w),
                  child: GridView.builder(
                    itemCount: list3.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(4.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 3.0,

                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,),
                    itemBuilder: (BuildContext context, int index) {
                      return    index < 3 ? Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),
                        color: PColor.containerColor,
                        child:  Text(
                          list3[index],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp),
                        ),
                      ):Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: PColor.containerColor)),

                        padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),

                        child:  Text(
                          list3[index],
                          style: TextStyle(
                              color: PColor.containerColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
