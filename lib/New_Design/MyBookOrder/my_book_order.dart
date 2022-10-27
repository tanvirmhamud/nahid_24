import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../Http/Slider/slider.dart';
import '../../Provider/homepage.dart';
import '../../utils/constants/colors.dart';

class MyBookOrder extends StatefulWidget {
  const MyBookOrder({super.key});

  @override
  State<MyBookOrder> createState() => _MyBookOrderState();
}

class _MyBookOrderState extends State<MyBookOrder> {
  bool loading = true;

  Future loaddata() async {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    await provider.getpaidcoursehistory();
    await provider.getliveclassorder();
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: PColor.containerColor,
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
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
                                              snapshot.data['data'][index]
                                                  ['img'],
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
                        padding: EdgeInsets.symmetric(vertical: 10.0.h),
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
                      // Container(
                      //   margin: EdgeInsets.symmetric(horizontal: 30.w),
                      //   child: GridView.builder(
                      //     itemCount: list1.length,
                      //     physics: NeverScrollableScrollPhysics(),
                      //     shrinkWrap: true,
                      //     padding: const EdgeInsets.all(4.0),
                      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //       crossAxisCount: 3,
                      //       childAspectRatio: 3.0,

                      //       mainAxisSpacing: 4.0,
                      //       crossAxisSpacing: 4.0,),
                      //     itemBuilder: (BuildContext context, int index) {
                      //       return    index < 3 ? Container(
                      //         alignment: Alignment.center,
                      //         padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),
                      //         color: PColor.containerColor,
                      //         child:  Text(
                      //           list1[index],
                      //           style: TextStyle(
                      //               color: Colors.white,
                      //               fontWeight: FontWeight.bold,
                      //               fontSize: 16.sp),
                      //         ),
                      //       ):Container(
                      //         alignment: Alignment.center,
                      //         decoration: BoxDecoration(
                      //             border: Border.all(color: PColor.containerColor)),

                      //         padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 10.w),

                      //         child:  Text(
                      //           list1[index],
                      //           style: TextStyle(
                      //               color: PColor.containerColor,
                      //               fontWeight: FontWeight.bold,
                      //               fontSize: 16.sp),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),

                      FittedBox(
                        child: DataTable(
                          checkboxHorizontalMargin: 0,
                          dividerThickness: 0,
                          horizontalMargin: 0,
                          headingRowHeight: 50.h,
                          dataRowHeight: 40.h,
                          columnSpacing: 0,
                          columns: [
                            DataColumn(
                                label: Expanded(
                                    child: tablecontainer(value: "Order Id"))),
                            DataColumn(
                                label: Expanded(
                                    child: tablecontainer(value: "Receipts"))),
                            DataColumn(
                                label: Expanded(
                                    child: tablecontainer(value: "Status"))),
                            DataColumn(
                                label: Expanded(
                                    child:
                                        tablecontainer(value: "track Order"))),
                          ],
                          rows: List.generate(3, (index) {
                            return DataRow(cells: [
                              DataCell(Expanded(child: rowcontainer("401"))),
                              DataCell(
                                  Expanded(child: rowcontainer("Click Here"))),
                              DataCell(Expanded(child: rowcontainer("Active"))),
                              DataCell(
                                  Expanded(child: rowcontainer("Click Here"))),
                            ]);
                          }),
                        ),
                      ),

                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        width: ScreenUtil.defaultSize.width.sw,
                        margin: EdgeInsets.symmetric(horizontal: 15.w),
                        padding: EdgeInsets.symmetric(vertical: 10.0.h),
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
                        margin: EdgeInsets.all(10.roundToDouble()),
                        width: double.infinity,
                        child: DataTable(
                          checkboxHorizontalMargin: 0,
                          dividerThickness: 0,
                          horizontalMargin: 0,
                          headingRowHeight: 50.h,
                          dataRowHeight: 40.h,
                          columnSpacing: 0,
                          columns: [
                            DataColumn(
                                label: Expanded(
                                    child: tablecontainer(value: "Order Id"))),
                            DataColumn(
                                label: Expanded(
                                    child: tablecontainer(value: "Payment"))),
                            DataColumn(
                                label: Expanded(
                                    child: tablecontainer(value: "Status"))),
                          ],
                          rows: List.generate(
                              provider.paidcourseOrderhistory!.data!.length,
                              (index) {
                            var data =
                                provider.paidcourseOrderhistory!.data![index];
                            return DataRow(cells: [
                              DataCell(Expanded(
                                  child: rowcontainer("${data.userId}"))),
                              DataCell(Expanded(
                                  child:
                                      rowcontainer("${data.paymentMethod}"))),
                              DataCell(Expanded(
                                  child: rowcontainer("${data.orderStatus}"))),
                            ]);
                          }),
                        ),
                      ),

                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        width: ScreenUtil.defaultSize.width.sw,
                        margin: EdgeInsets.symmetric(horizontal: 15.w),
                        padding: EdgeInsets.symmetric(vertical: 10.0.h),
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
                        margin: EdgeInsets.all(10.r),
                        width: double.infinity,
                        child: DataTable(
                          checkboxHorizontalMargin: 0,
                          dividerThickness: 0,
                          horizontalMargin: 0,
                          headingRowHeight: 50.h,
                          dataRowHeight: 40.h,
                          columnSpacing: 0,
                          columns: [
                            DataColumn(
                                label: Expanded(
                                    child: tablecontainer(value: "Order Id"))),
                            DataColumn(
                                label: Expanded(
                                    child: tablecontainer(value: "Receipts"))),
                            DataColumn(
                                label: Expanded(
                                    child: tablecontainer(value: "Status"))),
                          ],
                          rows: List.generate(
                              provider.liveclassorder!.data!.length, (index) {
                            var data = provider.liveclassorder!.data![index];
                            return DataRow(cells: [
                              DataCell(Expanded(
                                  child: rowcontainer("${data.userId}"))),
                              DataCell(Expanded(
                                  child:
                                      rowcontainer("${data.paymentMethod}"))),
                              DataCell(Expanded(
                                  child: rowcontainer("${data.orderStatus}"))),
                            ]);
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget tablecontainer({String? value}) {
    return Container(
      margin: EdgeInsets.only(right: 5.w),
      height: 35.h,
      // width: 70.w,
      alignment: Alignment.center,
      padding: EdgeInsets.all(5.r),
      child: Text(
        value!,
        style: TextStyle(fontSize: 14.sp, color: Colors.white),
      ),
      decoration: BoxDecoration(color: PColor.containerColor),
    );
  }

  Widget rowcontainer(String value) {
    return Container(
        margin: EdgeInsets.only(right: 5.w),
        // width: 70.w,
        height: 35.h,
        alignment: Alignment.center,
        padding: EdgeInsets.all(5.r),
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Text(value));
  }
}
