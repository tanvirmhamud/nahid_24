import 'package:badges/badges.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nahid_24/New_Design/MyBookOrder/my_book_order.dart';
import 'package:nahid_24/screens/drawer/drawer.dart';
import 'package:nahid_24/screens/profile/profile_list_item.dart';
import 'package:nahid_24/utils/constants/assets.dart';

import 'package:nahid_24/utils/constants/colors.dart';
import 'package:nahid_24/utils/widget/submit_button.dart';
import 'package:flutter/material.dart';

import '../../Http/Profile/profile.dart';
import '../../Http/Result/result.dart';
import '../../Model/profile.dart';
import '../../New_Design/MyLiveClass/myliveclass.dart';
import '../../New_Design/Mycourses/mycourses.dart';
import '../auth/login_screen.dart';
import '../home/shopping_cart/shopping_cart_page.dart';

import 'package:get/get.dart';
import '../../getx/selectbtn.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController institute = TextEditingController();

  int totalcurrentexam = 0;

  int totalmodelexam = 0;
  int totalquizeexam = 0;

  List<String> datalist = [];
  final ImagePicker _picker = ImagePicker();

  Future imageupload() async {
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      Httpprofile().imageupload(path: image.path).then((value) {
        setState(() {
          profileinfo = Httpprofile().getprofile();
        });
      });
    }
  }

  Future<Profile?> profileinfo = Httpprofile().getprofile();

  Future loaddata() async {
    var exam = await Httpresult().getexamresult();
    var model = await Httpresult().modelresult();
    var quize = await Httpresult().getquizeresult();

    if (exam.isNotEmpty) {
      for (var i = 0; i < exam.length; i++) {
        totalcurrentexam =
            totalcurrentexam + int.parse(exam[i]['total_correct'].toString());
      }
    }

    if (model.isNotEmpty) {
      for (var i = 0; i < model.length; i++) {
        totalmodelexam =
            totalmodelexam + int.parse(model[i]['total_correct'].toString());
      }
    }

    for (var i = 0; i < quize['data'].length; i++) {
      totalquizeexam = totalquizeexam +
          int.parse(quize['data'][i]['total_correct'].toString());
    }

    // setState(() {
    //   totalcurrentexam = data['total_correct'].toString();
    // });

    setState(() {});
  }

  @override
  void initState() {
    loaddata();
    super.initState();
  }

  final _controller = Get.put(Btncontroller());
  var box = Hive.box('user');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: Drawer(child: CustomDrawer()),
          appBar: AppBar(
            backgroundColor: PColor.containerColor,
            elevation: 0,
          ),
          body: FutureBuilder<Profile?>(
              future: profileinfo,
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  name.text = snapshot.data!.data!.name!;
                  number.text = snapshot.data!.data!.number!;
                  email.text = snapshot.data!.data!.email!;
                  institute.text = snapshot.data!.data!.institute ?? "";
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 150.h,
                          decoration: BoxDecoration(
                            color: PColor.containerColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.elliptical(200, 90),
                              bottomRight: Radius.elliptical(200, 90),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, -70),
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 82.r,
                            child: InkWell(
                              onTap: (() {
                                imageupload();
                              }),
                              child: CircleAvatar(
                                radius: 77.r,
                                child: snapshot.data!.data!.image == null
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Add your",
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            "picture",
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      )
                                    : Image.network(snapshot.data!.data!.image),
                                // backgroundImage: NetworkImage(snapshot
                                //         .data!.data!.image ??
                                //     "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        // ListTile(
                        //   dense: true,
                        //   leading: Image.asset(
                        //     PAssets.person,
                        //     scale: 19,
                        //   ),
                        //   title: testbox(hinttest: "Name", controller: name),
                        // ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 10.w),
                            Image.asset(
                              "assets/person.png",
                              height: 40.h,
                            ),
                            SizedBox(width: 10.w),
                            Flexible(
                                child: testbox(
                                    hinttest: "Name", controller: name)),
                          ],
                        ),
                        Divider(color: Colors.black),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 10.w),
                            Image.asset(
                              "assets/phone.png",
                              height: 40.h,
                            ),
                            SizedBox(width: 10.w),
                            Flexible(
                              child: testbox(
                                  hinttest: "Mobile Number",
                                  controller: number),
                            ),
                          ],
                        ),
                        Divider(color: Colors.black),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 10.w),
                            Image.asset(
                              "assets/email.png",
                              height: 40.h,
                            ),
                            SizedBox(width: 10.w),
                            Flexible(
                              child: testbox(
                                  hinttest: "Email Address", controller: email),
                            ),
                          ],
                        ),

                        Divider(color: Colors.black),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 10.w),
                            Image.asset(
                              "assets/home.png",
                              height: 40.h,
                            ),
                            SizedBox(width: 10.w),
                            Flexible(
                              child: testbox(
                                  hinttest: "My college/university",
                                  controller: institute),
                            ),
                          ],
                        ),
                        // ListTile(
                        //   dense: true,
                        //   leading: Image.asset(
                        //     PAssets.person,
                        //     scale: 19,
                        //   ),
                        //   title: testbox(
                        //       hinttest: "Institute", controller: institute),
                        // ),

                        Divider(color: Colors.black),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => MyBookOrder())));
                          },
                          child: Row(
                            children: [
                              SizedBox(width: 10.w),
                              Image.asset(
                                "assets/ic_my_all order.png",
                                height: 40.h,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                "My All Order",
                                style: _txtStyle(),
                              ),
                            ],
                          ),
                        ),
                        Divider(color: Colors.black),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => MyCoursespage())));
                          },
                          child: Row(
                            children: [
                              SizedBox(width: 10.w),
                              Image.asset(
                                "assets/play_circle.png",
                                height: 40.h,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                "My Paid Courses",
                                style: _txtStyle(),
                              ),
                            ],
                          ),
                        ),
                        // ListTile(
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: ((context) => MyCoursespage())));
                        //   },
                        //   leading: Image.asset(
                        //     PAssets.person,
                        //     scale: 19,
                        //   ),
                        //   title: Row(
                        //     children: [
                        //       Image.asset(
                        //         PAssets.person,
                        //         scale: 19,
                        //       ),
                        //       Text("My Courses"),
                        //     ],
                        //   ),
                        // ),
                        Divider(color: Colors.black),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => MyLiveClassPage())));
                          },
                          child: Row(
                            children: [
                              SizedBox(width: 10.w),
                              Image.asset(
                                "assets/play_circle.png",
                                height: 40.h,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                "My Live Class",
                                style: _txtStyle(),
                              ),
                            ],
                          ),
                        ),
                        // ListTile(
                        //   dense: true,
                        //   leading: Image.asset(
                        //     PAssets.person,
                        //     scale: 19,
                        //   ),
                        //   title: testbox(hinttest: "Email", controller: email),
                        // ),
                        Divider(color: Colors.black),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 10.w),
                            Image.asset(
                              "assets/icon/note.png",
                              height: 40.h,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              "Exam Completed",
                              style: _txtStyle(),
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              margin: EdgeInsets.only(right: 20.0),
                              decoration: BoxDecoration(
                                  color: PColor.submitButtonColorBlue,
                                  borderRadius: BorderRadius.circular(2)),
                              child: Text(
                                "0 ${totalcurrentexam}",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        // ListTile(
                        //   dense: true,
                        //   leading: Image.asset(
                        //     PAssets.person,
                        //     scale: 19,
                        //   ),
                        //   title: Row(
                        //     children: [
                        //       Text("Total Current Exam"),
                        //       Spacer(),
                        //       Text("${totalcurrentexam}")
                        //     ],
                        //   ),
                        // ),
                        Divider(color: Colors.black),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 10.w),
                            Image.asset(
                              "assets/icon/note.png",
                              height: 40.h,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              "Model Test Completed",
                              style: _txtStyle(),
                            ),
                            Spacer(),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                                margin: EdgeInsets.only(right: 20.0),
                                decoration: BoxDecoration(
                                    color: PColor.submitButtonColorBlue,
                                    borderRadius: BorderRadius.circular(2)),
                                child: Text(
                                  "0 ${totalmodelexam}",
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                        ),
                        // ListTile(
                        //   dense: true,
                        //   leading: Image.asset(
                        //     PAssets.person,
                        //     scale: 19,
                        //   ),
                        //   title: Row(
                        //     children: [
                        //       Text("Total Current Model"),
                        //       Spacer(),
                        //       Text("${totalmodelexam}")
                        //     ],
                        //   ),
                        // ),
                        Divider(color: Colors.black),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 10.w),
                            Image.asset(
                              "assets/icon/note.png",
                              height: 40.h,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              "Quize Completed",
                              style: _txtStyle(),
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              margin: EdgeInsets.only(right: 20.0),
                              decoration: BoxDecoration(
                                  color: PColor.submitButtonColorBlue,
                                  borderRadius: BorderRadius.circular(2)),
                              child: Text(
                                "0 ${totalquizeexam}",
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        Divider(color: Colors.black),
                        Row(
                          children: [
                            SizedBox(width: 10.w),
                            Image.asset(
                              "assets/icon/crown.png",
                              height: 40.h,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              "Prize Gained",
                              style: _txtStyle(),
                            ),
                          ],
                        ),
                        Divider(color: Colors.black),
                        InkWell(
                          onTap: () {
                            box.clear();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => LogInScreen())),
                                (route) => false);
                          },
                          child: Row(
                            children: [
                              SizedBox(width: 10.w),
                              Image.asset(
                                "assets/person.png",
                                height: 40.h,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                "Log out",
                                style: _txtStyle(),
                              ),
                            ],
                          ),
                        ),
                        // ListTile(
                        //   leading: Image.asset(
                        //     PAssets.person,
                        //     scale: 19,
                        //   ),
                        //   title: Row(
                        //     children: [
                        //       Text("Total Current Quize"),
                        //       Spacer(),
                        //       Text("${totalquizeexam}")
                        //     ],
                        //   ),
                        // ),

                        // ListTile(
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: ((context) => MyLiveClassPage())));
                        //   },
                        //   leading: Image.asset(
                        //     PAssets.person,
                        //     scale: 19,
                        //   ),
                        //   title: Row(
                        //     children: [
                        //       Text("My Live Class"),
                        //     ],
                        //   ),
                        // ),

                        // ListView.separated(
                        //   shrinkWrap: true,
                        //   scrollDirection: Axis.vertical,
                        //   itemCount: item.length,
                        //   physics: NeverScrollableScrollPhysics(),
                        //   itemBuilder: (BuildContext context, int index) {
                        //     if (index == 5) {
                        //       return ListTile(
                        //         leading: Image.asset(
                        //           PAssets.exam_completed,
                        //           scale: 19,
                        //         ),
                        //         title: Text(
                        //           "Exam Completed",
                        //           style: TextStyle(color: PColor.submitButtonColorBlue),
                        //         ),
                        //         trailing: Container(
                        //           color: PColor.submitButtonColorBlue,
                        //           child:
                        //               Text("00", style: TextStyle(color: Colors.white)),
                        //         ),
                        //       );
                        //     } else if (index == 6) {
                        //       return ListTile(
                        //         leading: Image.asset(
                        //           PAssets.exam_completed,
                        //           scale: 19,
                        //         ),
                        //         title: Text(
                        //           "Model Test Completed",
                        //           style: TextStyle(color: PColor.submitButtonColorBlue),
                        //         ),
                        //         trailing: Container(
                        //           color: PColor.submitButtonColorBlue,
                        //           child:
                        //               Text("00", style: TextStyle(color: Colors.white)),
                        //         ),
                        //       );
                        //     } else if (index == 7) {
                        //       return ListTile(
                        //         leading: Image.asset(
                        //           PAssets.exam_completed,
                        //           scale: 19,
                        //         ),
                        //         title: Text(
                        //           "Quiz Completed",
                        //           style: TextStyle(color: PColor.submitButtonColorBlue),
                        //         ),
                        //         trailing: Container(
                        //           color: PColor.submitButtonColorBlue,
                        //           child:
                        //               Text("00", style: TextStyle(color: Colors.white)),
                        //         ),
                        //       );
                        //     } else if (index == 8) {
                        //       return ListTile(
                        //         leading: Image.asset(
                        //           PAssets.exam_completed,
                        //           scale: 19,
                        //         ),
                        //         title: Text(
                        //           "Prize Gained",
                        //           style: TextStyle(color: PColor.submitButtonColorBlue),
                        //         ),
                        //         trailing: Container(
                        //           color: PColor.submitButtonColorBlue,
                        //           child:
                        //               Text("00", style: TextStyle(color: Colors.white)),
                        //         ),
                        //       );
                        //     } else {
                        //       return ListTile(
                        //         onTap: () {
                        //           Navigator.push(
                        //             context,
                        //             MaterialPageRoute(
                        //                 builder: (_) => listTile[index].screens!),
                        //           );
                        //         },
                        //         leading: item[index].image,
                        //         title: Text(
                        //           item[index].title,
                        //           style: TextStyle(color: PColor.submitButtonColorBlue),
                        //         ),
                        //       );
                        //     }
                        //   },
                        //   separatorBuilder: (BuildContext context, int index) {
                        //     return Divider(
                        //       thickness: 2,
                        //       color: PColor.containerColor,
                        //     );
                        //   },
                        // ),

                        // SumitButton(
                        //     width: 100,
                        //     height: 30,
                        //     radius: 10,
                        //     onTap: () {
                        //       Httpprofile().proileupdate(
                        //           name: name.text,
                        //           institute: institute.text,
                        //           number: number.text);
                        //     },
                        //     title: "Save",
                        //     color: PColor.containerColor),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }))),
    );
  }

  Widget testbox({TextEditingController? controller, hinttest}) {
    return TextField(
      controller: controller,
      style: _txtStyle(),
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hinttest,
          hintStyle: _txtStyle(),
          isDense: true,
          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
    );
  }

  TextStyle _txtStyle() {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: PColor.submitButtonColorBlue,
    );
  }
}
