import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nahid_24/Http/Live_Class/live_class.dart';
import 'package:nahid_24/New_Design/Homepage_design/Free_course/free_course_video.dart';
import 'package:nahid_24/constant.dart';
import 'package:provider/provider.dart';

import '../../../Http/Free_Course/free_course.dart';
import '../../../Http/Paid_Course/paid_course.dart';
import '../../../Model/Alldistrict/alldistrict.dart';
import '../../../Model/Alldistrict/subdistrict.dart';
import '../../../Model/LiveClass/liveclass_detais.dart';
import '../../../Model/Paid_Course/paid_course_details.dart';
import '../../../Provider/homepage.dart';
import '../../../utils/constants/colors.dart';

class LiveClassbuypage extends StatefulWidget {
  final String classid;
  final LiveClassdetails liveClassdetails;
  const LiveClassbuypage(
      {Key? key, required this.classid, required this.liveClassdetails})
      : super(key: key);

  @override
  State<LiveClassbuypage> createState() => _LiveClassbuypageState();
}

class _LiveClassbuypageState extends State<LiveClassbuypage> {
  String _dropDownValue = 'Please select your payment';
  var colorEditText = const Color(0xffefefef);

  TextEditingController name = TextEditingController();
  TextEditingController yournumber = TextEditingController();
  TextEditingController paymentmethod = TextEditingController();
  TextEditingController payment_number = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController trx = TextEditingController();

  bool loading = false;

  Future orderpaidcourse() async {
    setState(() {
      loading = true;
    });
    await HttpLiveClass().liveclassorder(
        annount: amount.text,
        number: yournumber.text,
        paymentnumber: payment_number.text,
        paymentmethod: _dropDownValue,
        trxid: trx.text,
        name: name.text,
        classid: widget.classid);
    setState(() {
      loading = false;
    });
  }

  int subdistrictshow = 0;
  bool loading2 = true;

  Future loaddata() async {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    await provider.getalldistrict();
    setState(() {
      loading2 = false;
    });
  }

  @override
  void initState() {
    amount.text = widget.liveClassdetails.data!.price!;
    loaddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: PColor.containerColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        title: Text(
          'অর্ডার কনফার্মেশন',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: PColor.containerColor,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    Image.network(
                                  '$imageurl${widget.liveClassdetails.data!.image}',
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
                                    widget.liveClassdetails.data!.className!,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                  Text(
                                    "৳ ${widget.liveClassdetails.data!.price!}",
                                    style: TextStyle(
                                      color: Colors.black87,
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
                      color: Colors.black54,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Name",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          TextField(
                            keyboardType: TextInputType.name,
                            controller: name,
                            style: TextStyle(
                                fontSize: 20.sp, color: Colors.black87),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.r),
                              fillColor: colorEditText,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                              ),
                              hintStyle: TextStyle(fontSize: 20.sp),
                              isDense: true,
                              hintText: 'Full Name',
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            "Your Number",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          TextField(
                            controller: yournumber,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize: 20.sp, color: Colors.black87),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.r),
                              fillColor: colorEditText,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                              ),
                              hintStyle: TextStyle(fontSize: 20.sp),
                              isDense: true,
                              hintText: 'Number ',
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            "District",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          district(),
                          SizedBox(
                            height: 15.h,
                          ),
                          subdistrictshow == 1
                              ? CircularProgressIndicator()
                              : subdistrictshow == 0
                                  ? Container()
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "SubDistrict",
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 7.h,
                                        ),
                                        subdistrict(),
                                      ],
                                    ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            "Send Money to 01787943429 personal number",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            "Payment Method",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            decoration: BoxDecoration(
                                color: colorEditText,
                                borderRadius: BorderRadius.circular(6.r)),

                            // dropdown below..
                            child: DropdownButton(
                              isDense: true,
                              underline: SizedBox.shrink(),
                              hint: _dropDownValue == null
                                  ? Text('Dropdown')
                                  : Text(
                                      _dropDownValue,
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 20.sp),
                                    ),
                              isExpanded: true,
                              iconSize: 30.0,
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 20.sp),
                              items: ['Bkash', 'Rocket', 'Nagad'].map(
                                (val) {
                                  return DropdownMenuItem<String>(
                                    value: val,
                                    child: Text(val),
                                  );
                                },
                              ).toList(),
                              onChanged: (val) {
                                setState(
                                  () {
                                    _dropDownValue = val.toString();
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            "Your Bkash number",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            controller: payment_number,
                            style: TextStyle(
                                fontSize: 20.sp, color: Colors.black87),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.r),
                              fillColor: colorEditText,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                              ),
                              hintStyle: TextStyle(fontSize: 20.sp),
                              isDense: true,
                              hintText: 'Your Number',
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Transaction Id",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            controller: trx,
                            style: TextStyle(
                                fontSize: 20.sp, color: Colors.black87),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.r),
                              fillColor: colorEditText,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                              ),
                              hintStyle: TextStyle(fontSize: 20.sp),
                              isDense: true,
                              hintText: 'Your Number',
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Amount",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            controller: amount,
                            style: TextStyle(
                                fontSize: 20.sp, color: Colors.black87),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.r),
                              fillColor: colorEditText,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 1.0),
                              ),
                              hintStyle: TextStyle(fontSize: 20.sp),
                              isDense: true,
                              hintText: 'Amount',
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                border: Border.all(color: Colors.black45),
                                color: Colors.white30),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.r),
                                  color: Colors.white),
                              child: Container(
                                padding: EdgeInsets.all(5.r),
                                child: Text(
                                  "01787943429 Personal Number এ ${amount.text} টাকা Send Money করার পর Submit বাটনে Click করুন। Send Money না করে Submit বাটনে Click করলে আপনার order টি Cancelled হয়ে যাবে।",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 80.h,
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
                child: loading
                    ? Center(child: CircularProgressIndicator())
                    : Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(10.r),
                        child: MaterialButton(
                            onPressed: () {
                              orderpaidcourse();
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (_) => FreeCourseVideo()));
                            },
                            minWidth: ScreenUtil.defaultSize.width,
                            color: PColor.containerColor,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                            )),
                      ))
          ],
        ),
      ),
    ));
  }

  Widget district() {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<AlldistrictDatum>(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.r),
          fillColor: colorEditText,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1.0),
          ),
          hintStyle: TextStyle(fontSize: 20.sp),
          isDense: true,
          hintText: 'Select District',
        ),
        items: List.generate(provider.alldistrict!.data!.length, (index) {
          var data = provider.alldistrict!.data![index];
          return DropdownMenuItem(child: Text(data.district!), value: data);
        }),
        onChanged: (value) async {
          print(value!.district);
          setState(() {
            subdistrictshow = 1;
          });
          await provider.getsubdistrict(value.id!);
          setState(() {
            subdistrictshow = 2;
          });
        },
      ),
    );
  }

  Widget subdistrict() {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField<SubdistrictDatum>(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.r),
          fillColor: colorEditText,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1.0),
          ),
          hintStyle: TextStyle(fontSize: 20.sp),
          isDense: true,
          hintText: 'Select Subdistrict',
        ),
        items: List.generate(provider.subdistrict!.data!.length, (index) {
          var data = provider.subdistrict!.data![index];
          return DropdownMenuItem(child: Text(data.subDistrict!), value: data);
        }),
        onChanged: (value) {
          print(value!.subDistrict);
        },
      ),
    );
  }
}
