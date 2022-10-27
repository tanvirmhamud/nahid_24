import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nahid_24/utils/constants/assets.dart';
import 'package:flutter/material.dart';
import '../../New_Design/Exam/quizesubject.dart';
import '../../New_Design/Homepage_design/Free_course/free_course.dart';
import '../../New_Design/Homepage_design/Live_Class/live_class.dart';
import '../../New_Design/Homepage_design/Paid_course/paid_course.dart';
import '../../New_Design/Model/model_subject.dart';
import '../../New_Design/product/books_screen.dart';
import '../../getx/selectbtn.dart';

class Customdrawer extends StatefulWidget {
  const Customdrawer({Key? key}) : super(key: key);

  @override
  State<Customdrawer> createState() => _CustomdrawerState();
}

class _CustomdrawerState extends State<Customdrawer> {
  var box = Hive.box('user');
  final _controller = Get.put(Btncontroller());

  final classes = {
    'এইচ এসসি': 'HSC_Video_Subject',
    'ভর্তি প্রস্তুতি': 'Admission_Video',
    'চাকরি প্রস্তুতি': 'Exam_subjects',
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250.h,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40)),
              color: Color(0xf045de9).withOpacity(0.90),
            ),
            // child: Padding(
            //   padding: const EdgeInsets.only(
            //     top: 25,
            //   ),
            //   child: Stack(
            //     children: [
            //       Positioned(
            //         top: 20,
            //         left: 0,
            //         right: 0,
            //         // child: Column(
            //         //   mainAxisAlignment: MainAxisAlignment.center,
            //         //   children: [
            //         //     InkWell(
            //         //       onTap: () {},
            //         //       child: CircleAvatar(
            //         //         radius: 45,
            //         //         backgroundColor: Colors.white,
            //         //         child: Padding(
            //         //           padding: const EdgeInsets.only(left: 10, top: 20),
            //         //           child: Column(
            //         //             children: [
            //         //               Text(
            //         //                 "Add your  ",
            //         //                 textAlign: TextAlign.left,
            //         //                 style: TextStyle(
            //         //                     fontSize: 18,
            //         //                     color: Colors.black,
            //         //                     fontWeight: FontWeight.w500),
            //         //               ),
            //         //               Text(
            //         //                 "picture ",
            //         //                 textAlign: TextAlign.left,
            //         //                 style: TextStyle(
            //         //                     fontSize: 18,
            //         //                     color: Colors.black,
            //         //                     fontWeight: FontWeight.w500),
            //         //               ),
            //         //             ],
            //         //           ),
            //         //         ),
            //         //       ),
            //         //     ),
            //         //     SizedBox(
            //         //       height: 15,
            //         //     ),
            //         //     Text(
            //         //       "Name: ${box.get('name')}",
            //         //       style: TextStyle(
            //         //           color: Colors.white,
            //         //           fontSize: 18,
            //         //           fontWeight: FontWeight.w700),
            //         //     ),
            //         //   ],
            //         // ),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             InkWell(
            //               onTap: () {},
            //               child: CircleAvatar(
            //                 radius: 40,
            //                 backgroundColor: Colors.white,
            //                 child: Column(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     Text(
            //                       "Add your  ",
            //                       textAlign: TextAlign.left,
            //                       style: TextStyle(
            //                           fontSize: 16,
            //                           color: Colors.black,
            //                           fontWeight: FontWeight.w500),
            //                     ),
            //                     Text(
            //                       "picture ",
            //                       textAlign: TextAlign.left,
            //                       style: TextStyle(
            //                           fontSize: 16,
            //                           color: Colors.black,
            //                           fontWeight: FontWeight.w500),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //             SizedBox(
            //               width: 15,
            //             ),
            //             Column(
            //               children: [
            //                 Text(
            //                   "Name: ${box.get('name')}",
            //                   style: TextStyle(
            //                       color: Colors.white,
            //                       fontSize: 16,
            //                       fontWeight: FontWeight.w700),
            //                 ),
            //                 Text(
            //                   "Add your college/University: ${box.get('name')}",
            //                   style: TextStyle(
            //                       color: Colors.white,
            //                       fontSize: 16,
            //                       fontWeight: FontWeight.w700),
            //                 ),
            //                 Text(
            //                   "Name: ${box.get('name')}",
            //                   style: TextStyle(
            //                       color: Colors.white,
            //                       fontSize: 18,
            //                       fontWeight: FontWeight.w700),
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Add your  ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "picture ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 05,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Name : ${box.get('name')}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      "Add Your College/University :",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      "Prize :",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      "Badge :",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: Container(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: listTile.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => listTile[index].screens!),
                      );
                    },
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Image.asset(
                          listTile[index].image,
                          height: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          listTile[index].title,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 20,
                  );
                },
              ),
            ),
          ),
          // Flexible(
          //   child: MaterialButton(
          //     onPressed: () {
          //       box.clear();
          //       Navigator.pushAndRemoveUntil(
          //           context,
          //           MaterialPageRoute(builder: ((context) => LogInScreen())),
          //           (route) => false);
          //     },
          //     child: Text("Logout"),
          //   ),
          // )
        ],
      ),
    );
  }

  List<DrawerList> listTile = [
    DrawerList(
      image: PAssets.d_books,
      title: "Books",
      screens: BookScreen(),
    ),
    DrawerList(
      image: PAssets.d_play_button,
      title: "ফ্রি কোর্স",
      screens: Scaffold(
        appBar: AppBar(
          title: Text("ফ্রি কোর্স"),
        ),
        body: FreeCoursePage(valueHide: false),
      ),
    ),
    DrawerList(
      image: PAssets.d_play_button,
      title: "পেইড কোর্স",
      screens:Scaffold(
        appBar: AppBar(
          title: Text("পেইড কোর্স"),
        ),
        body: PaidCoursePage(valueHide: true),
      ) ,
    ),
    DrawerList(
      image: PAssets.d_play_button,
      title: "লাইভ ক্লাস",
      screens:Scaffold(
        appBar: AppBar(
          title: Text("লাইভ ক্লাস"),
        ),
        body: LiveClassspage(valueHide: true),
      ) ,
    ),
    DrawerList(
      image: PAssets.e_m_q,
      title: "Exam",
      screens: Scaffold(
        appBar: AppBar(
          title: Text("Exam"),
        ),
        body: QuizeSubjectPage(),
      ),
    ),
    DrawerList(
      image: PAssets.e_m_q,
      title: "Model Test",
      screens: Scaffold(
        appBar: AppBar(
          title: Text("Model Test"),
        ),
        body: ModelSubjectPage(),
      ),
    ),
    DrawerList(
      image: PAssets.youtube,
      title: "Youtube",
      screens: Container(),
    ),
    DrawerList(
      image: PAssets.facebook,
      title: "Facebook",
      screens: Container(),
    ),
    DrawerList(
      image: PAssets.instagram,
      title: "Instagram",
      screens: Container(),
    ),
    DrawerList(
      image: PAssets.about_us,
      title: "About us",
      screens: Container(),
    ),
    DrawerList(
      image: PAssets.contact,
      title: "Contact us",
      screens: Container(),
    ),
  ];
}

class DrawerList {
  String image;
  String title;
  Widget? screens;

  DrawerList({
    required this.image,
    required this.title,
    this.screens,
  });
}
