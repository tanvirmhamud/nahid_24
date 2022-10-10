import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nahid_24/domain/app/shop/product_model.dart';

import '../../utils/constants/colors.dart';

class BookDetailsScreen extends StatelessWidget {
  BookDetailsScreen({super.key, required this.product});

  // List product;
  ProductModel? product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: PColor.containerColor,
            elevation: 0,
            leading: Builder(builder: (context) {
              return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    size: 38.r,
                  ));
            }),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Badge(
                  badgeContent: Text('0'),
                  position: BadgePosition.topStart(),
                  child: Container(
                    child: Image.asset(
                      "assets/ic_avatar.png",
                      height: 34.r,
                      width: 34.r,
                    ),
                  ),
                ),
              )
            ]),
        body: Container(
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  height: ScreenUtil.defaultSize.height / 2,
                  width: ScreenUtil.defaultSize.width.sw,
                  decoration: BoxDecoration(
                    color: PColor.containerColor,
                  ),
                ),
                Container(
                    color: Color(0xFFF5F5F5),
                    margin:
                        EdgeInsets.only(left: 10.w, bottom: 10.h, right: 10.w),
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black45)),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: Column(
                          // scrollDirection: Axis.vertical,
                          // shrinkWrap: true,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  splashColor: Colors.green, // Splash color
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Row(
                                    children: [
                                      ClipOval(
                                        child: Material(
                                          color: PColor.containerColor,
                                          // Button color
                                          child: Container(
                                            padding: EdgeInsets.all(3),
                                            alignment: Alignment.center,
                                            child: Icon(
                                              Icons.arrow_back_ios_new_sharp,
                                              color: Colors.white,
                                              size: 13.r,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6.w,
                                      ),
                                      Text(
                                        "Books",
                                        style: TextStyle(
                                            fontSize: 22.0.sp,
                                            fontWeight: FontWeight.w900,
                                            color: PColor.containerColor),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  "See all",
                                  style: TextStyle(
                                      fontSize: 21.0.sp,
                                      fontWeight: FontWeight.w800,
                                      color: PColor.containerColor),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Container(
                                alignment: Alignment.center,
                                height: 350.h,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black45),
                                    color: Colors.white),
                                width: ScreenUtil.defaultSize.width.sw,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.w, horizontal: 10.h),
                                child: Image.network(
                                  "${product!.photo}",
                                  height: 350.h,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "${product!.name}",
                              style: TextStyle(
                                  fontSize: 28.0.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87),
                            ),
                            SizedBox(
                              height: 14.h,
                            ),
                            Row(
                              children: [
                                RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 24.sp,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 0.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: PColor.containerColor,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Flexible(
                                    child: Text(
                                  "( 4 Customer Reviews )",
                                  style: TextStyle(
                                      fontSize: 15.0.sp,
                                      fontWeight: FontWeight.w500,
                                      color: PColor.containerColor),
                                ))
                              ],
                            ),
                            SizedBox(
                              height: 10.0.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "৳ ",
                                  style: TextStyle(
                                      fontSize: 20.0.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Expanded(
                                  child: Text(
                                    product!.price,
                                    style: TextStyle(
                                        fontSize: 24.0.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8.0.h,
                            ),
                            custom_btn(
                                onTap: () {},
                                text: "কিছু পেজ পড়ে দেখুন (pdf )"),
                            custom_btn(
                                onTap: () {}, text: "বইটি কেমন তা দেখে নিন"),
                            custom_btn(
                                onTap: () {}, text: "বইটি থেকে বিগত বছরে কমনের প্রমাণসমূহ"),
                            custom_btn(
                                onTap: () {},
                                text:
                                    "কিভাবে বই অর্ডার করতে হয়? (Video Tutorial)"),
                            custom_btn(
                                onTap: () {},
                                text:
                                    "যে যে লাইব্রেরিতে বইটি পাওয়া যেতে পারে "),
                            SizedBox(
                              height: 10.0.h,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4.h, horizontal: 4.w),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.black45)),
                                  alignment: Alignment.center,
                                  child: InkWell(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.black87,
                                        size: 24.r,
                                      )),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5.5.h, horizontal: 8.w),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.black45)),
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18.r),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4.h, horizontal: 4.w),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.black45)),
                                  child: InkWell(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.black87,
                                        size: 24.r,
                                      )),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                MaterialButton(
                                  onPressed: () {},
                                  height: 35.h,
                                  color: PColor.containerColor,
                                  child: Text(
                                    "Add to cart",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.sp),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.0.h,
                            ),
                            Container(
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Description",
                                    style: TextStyle(
                                        color: PColor.containerColor,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 6.0.h,
                                  ),
                                  Divider(color: PColor.containerColor),
                                  SizedBox(
                                    height: 6.0.h,
                                  ),
                                  Text(
                                    "Why you need to study ?",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  SizedBox(
                                    height: 3.0.h,
                                  ),
                                  Text(
                                    "1. Borden your mind",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 3.0.h,
                                  ),
                                  Text(
                                    "2. Help to think",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 3.0.h,
                                  ),
                                  Text(
                                    "3. Decepline",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.0.h,
                            ),
                            Text(
                              "Take online courses on Study.com that are fun and engaging. Pass exams to earn real college credit. Research schools and degrees to further your education.",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10.0.h,
                            ),
                            Text(
                              "Add your Rivew",
                              style: TextStyle(
                                  color: PColor.containerColor,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 10.0.h,
                            ),
                            Divider(),
                            SizedBox(
                              height: 10.0.h,
                            ),
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "Your rating",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 10.0.h,
                                  ),
                                  RatingBar.builder(
                                    initialRating: 0,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 35.sp,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 0.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star_border,
                                      color: PColor.containerColor,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  SizedBox(
                                    height: 10.0.h,
                                  ),
                                  Text(
                                    "Your review",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 5.0.h,
                                  ),
                                  TextFormField(
                                    minLines: 2,
                                    maxLines: 5,
                                    keyboardType: TextInputType.multiline,
                                    decoration: InputDecoration(
                                      hintText: '',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4.0.sp)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.0.h,
                            ),
                            MaterialButton(
                              onPressed: () {},
                              color: PColor.containerColor,
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            SizedBox(
                              height: 10.0.h,
                            ),
                            Text(
                              "Review (02)",
                              style: TextStyle(
                                  color: PColor.containerColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 6.0.h,
                            ),
                            Divider(color: PColor.containerColor),
                            SizedBox(
                              height: 6.0.h,
                            ),
                            Container(
                              color: Colors.white,
                                child: ListView.builder(
                                  padding: EdgeInsets.symmetric(vertical: 6.h,horizontal: 6.w),
                              itemCount: 6,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, i) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 55.sp,
                                          width: 55.sp,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(45.0.sp),
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
                                              'assets/ic_avatar.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Nahid Hasean",
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  Text(
                                                    "- March24, 2021",
                                                    style: TextStyle(
                                                        color: Colors.black38,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 6.h,
                                              ),
                                              RatingBar.builder(
                                                initialRating: 0,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                ignoreGestures: true,
                                                itemSize: 16.sp,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 0.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: PColor.containerColor,
                                                ),
                                                onRatingUpdate: (rating) {
                                                  print(rating);
                                                },
                                              ),
                                              SizedBox(
                                                height: 6.h,
                                              ),
                                              Text(
                                                "রাবির এ ইউনিট এর শেষ  সময়ের প্রস্তুতি জন্য বইটি কোনো বিকল্প নেই। ",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 17.sp,
                                                    fontWeight: FontWeight.w700,
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    Divider()
                                  ],
                                );
                              },
                            )),
                            SizedBox(
                              height: 10.0.h,
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            )),
      ),
    );
  }

  MaterialButton custom_btn({
    VoidCallback? onTap,
    String? text,
  }) {
    return MaterialButton(
        onPressed: onTap,
        minWidth: ScreenUtil.defaultSize.width,
        color: PColor.containerColor,
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "${text}",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700),
          ),
        ));
  }
}
