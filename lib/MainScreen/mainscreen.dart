// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:clean_api/clean_api.dart';
// import 'package:get/get.dart';
// import 'package:nahid_24/New_Design/Exam/quizesubject.dart';
// import 'package:nahid_24/New_Design/Model/model_subject.dart';
// import 'package:nahid_24/application/course/course_provider.dart';
// import 'package:nahid_24/application/subject/subject_provider.dart';
// import 'package:nahid_24/getx/selectbtn.dart';
// import 'package:nahid_24/screens/course/course_page.dart';
// import 'package:nahid_24/screens/drawer/drawer.dart';
// import 'package:nahid_24/screens/pages_we_created.dart';
// import 'package:nahid_24/screens/quiz/quiz_page.dart';
// import 'package:nahid_24/utils/constants/colors.dart';
// import 'package:nahid_24/widget/quiz_dialogue.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../application/subject/subject_state.dart';
// import '../utils/constants/assets.dart';

// class MainScreen extends ConsumerStatefulWidget {
//   MainScreen({Key? key}) : super(key: key);

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreen();
// }

// class _HomeScreen extends ConsumerState<MainScreen> {
//   final List<String> sImage = ["assets/silder.jpg", "assets/slider2.jpg"];

//   final classes = {
//     'এইচ এসসি': 'HSC_Video_Subject',
//     'ভর্তি প্রস্তুতি': 'Admission_Video',
//     'চাকরি প্রস্তুতি': 'Exam_subjects',
//   };

//   final _controller = Get.put(Btncontroller());

//   int select2ndrow = 0;

//   List<String> classname = [];

//   PageController pageController = PageController();

//   @override
//   void initState() {
//     classname.add("HSC_Video_Subject");
//     Future.delayed(Duration(milliseconds: 100), () {
//       ref
//           .read(subjectProvider.notifier)
//           .getSubjectsList(className: classes.values.first);
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final subjectsState = ref.watch(subjectProvider);
//     return Scaffold(
//       backgroundColor: PColor.containerColor,
//       bottomNavigationBar: buttomnavbar(),
//       drawer: Drawer(
//         child: CustomDrawer(),
//       ),
//       appBar: AppBar(
//         backgroundColor: Color(0xf045de9).withOpacity(0.7),
//         elevation: 0,
//         leading: Builder(builder: (context) {
//           return IconButton(
//               onPressed: () {
//                 Scaffold.of(context).openDrawer();
//               },
//               icon: Icon(
//                 Icons.menu,
//                 size: 32,
//               ));
//         }),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const PagesCreated()));
//             },
//             icon: Container(
//               child: Image.asset(
//                 "assets/cart.png",
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
//         child: Column(
//           children: [
//             Container(
//               color: Colors.white,
//               width: double.infinity,
//               height: 120,
//               child: CarouselSlider(
//                   options: CarouselOptions(
//                     enableInfiniteScroll: false,
//                     initialPage: 0,
//                     enlargeCenterPage: true,
//                     viewportFraction: 0.85,
//                   ),
//                   items: List<Widget>.generate(
//                       2, (index) => Image.asset(sImage[index % 2]))),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               color: Colors.white,
//               width: double.infinity,
//               height: 100,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: classes
//                         .map(
//                           (key, value) => MapEntry(
//                             key,
//                             SizedBox(
//                               height: 30,
//                               width: 110,
//                               child: ElevatedButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     classname.clear();
//                                     classname.add(value);
//                                   });
//                                   ref
//                                       .read(subjectProvider.notifier)
//                                       .getSubjectsList(className: value);
//                                   _controller.change2ndbtn(0);
//                                 },
//                                 child: Text(key),
//                                 style: ElevatedButton.styleFrom(
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(20),
//                                     ),
//                                     primary: classname.contains(value)
//                                         ? Colors.purple.withOpacity(0.9)
//                                         : Color(0xf045de9).withOpacity(0.90)),
//                               ),
//                             ),
//                           ),
//                         )
//                         .values
//                         .toList(),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       SizedBox(
//                         height: 30,
//                         width: 110,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             setState(() {
//                               classname.clear();
//                               classname.add("পরীক্ষা");
//                             });
//                             _controller.change2ndbtn(1);
//                             _controller
//                                 .selectmodelsubjectindex(01984651465655646);
//                             _controller.getselectsubject(898465456);
//                             // final int? id = await QuizDialogue.show(context);
//                             // Logger.i("ok ok $id");
//                             // Navigator.push(
//                             //     context,
//                             //     MaterialPageRoute(
//                             //         builder: (_) => QuizPage(
//                             //               subjectId: 1,
//                             //             )));
//                           },
//                           child: Text("পরীক্ষা"),
//                           style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               primary: classname.contains("পরীক্ষা")
//                                   ? Colors.purple.withOpacity(0.9)
//                                   : Color(0xf045de9).withOpacity(0.90)),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 30,
//                         width: 110,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             setState(() {
//                               classname.clear();
//                               classname.add("মডেল টেস্ট");
//                             });
//                             _controller.change2ndbtn(2);
//                             _controller
//                                 .selectmodelsubjectindex(01984651465655646);
//                             // final int? subjectId =
//                             //     await ModelTestDialogue.show(context);
//                             // Logger.i("ok ok $subjectId");
//                             // if (subjectId != null) {
//                             //   // Navigator.push(
//                             //   //     context,
//                             //   //     MaterialPageRoute(
//                             //   //         builder: (_) => QuizPage(
//                             //   //               subjectId: 1,
//                             //   //             )));
//                             //   final ModelTestTopicModel? topic =
//                             //       await ModelTestTopicDialog.show(
//                             //           context, subjectId);
//                             //   Logger.i("topic id ${topic?.id}");
//                             //   if (topic != null) {
//                             //     Navigator.of(context).push(MaterialPageRoute(
//                             //         builder: (_) => ModelTestPage(
//                             //               titleId: int.parse(topic.title_id),
//                             //               subjectId:
//                             //                   int.parse(topic.test_subject_id),
//                             //               topicId: topic.id,
//                             //             )));
//                             //   }
//                             // }
//                           },
//                           child: Text("মডেল টেস্ট"),
//                           style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               primary: classname.contains("মডেল টেস্ট")
//                                   ? Colors.purple.withOpacity(0.9)
//                                   : Color(0xf045de9).withOpacity(0.90)),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 30,
//                         width: 110,
//                         child: ElevatedButton(
//                           onPressed: () async {
//                             setState(() {
//                               classname.clear();
//                               classname.add("কুইজ");
//                             });
//                             final int? id = await QuizDialogue.show(context);
//                             Logger.i("ok ok $id");
//                             if (id != null) {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (_) => QuizPage(
//                                             subjectId: id,
//                                           )));
//                             }
//                           },
//                           child: Text("কুইজ"),
//                           style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               primary: classname.contains("কুইজ")
//                                   ? Colors.purple.withOpacity(0.9)
//                                   : Color(0xf045de9).withOpacity(0.90)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             // Container(
//             //   padding: EdgeInsets.symmetric(horizontal: 10),
//             //   color: Color(0xffE5E5E5),
//             //   child: Row(
//             //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //     children: [
//             //       TextButton(
//             //           onPressed: () {},
//             //           child: Text(
//             //             "Courses",
//             //             style: TextStyle(
//             //                 fontWeight: FontWeight.bold, fontSize: 18),
//             //           )),
//             //       TextButton(
//             //           onPressed: () {},
//             //           child: Text(
//             //             "See all",
//             //             style: TextStyle(
//             //                 fontWeight: FontWeight.bold, fontSize: 18),
//             //           ))
//             //     ],
//             //   ),
//             // ),

//             Expanded(
//                 child: PageView(
//               children: [
//                 hscbox(subjectsState),
//                 QuizeSubjectPage(),
//                 ModelSubjectPage()
//               ],
//             )),

//             // Expanded(
//             //   child: Obx(() {
//             //     if (_controller.select2ndbtn == 0) {
//             //       return Container(
//             //         color: Color(0xffE5E5E5),
//             //         padding: EdgeInsets.symmetric(horizontal: 10),
//             //         child: subjectsState.loading
//             //             ? Center(child: CircularProgressIndicator())
//             //             : subjectsState.subjects.isEmpty
//             //                 ? Center(child: Text('No course available'))
//             //                 : GridView.builder(
//             //                     itemCount: subjectsState.subjects.length,
//             //                     gridDelegate:
//             //                         SliverGridDelegateWithFixedCrossAxisCount(
//             //                       mainAxisExtent: 241,
//             //                       crossAxisCount: 2,
//             //                       crossAxisSpacing: 8,
//             //                       mainAxisSpacing: 5,
//             //                     ),
//             //                     itemBuilder: (BuildContext, index) {
//             //                       final subject = subjectsState.subjects[index];
//             //                       return GestureDetector(
//             //                         onTap: () {
//             //                           Navigator.push(
//             //                               context,
//             //                               MaterialPageRoute(
//             //                                   builder: (_) => CoursePage(
//             //                                         subject: Subject(
//             //                                             subject: subject,
//             //                                             courseName: ref.watch(
//             //                                                 subjectProvider.select(
//             //                                                     (value) => value
//             //                                                         .className))),
//             //                                       )));
//             //                         },
//             //                         child: Container(
//             //                           decoration: BoxDecoration(
//             //                             borderRadius: BorderRadius.circular(20),
//             //                             boxShadow: [
//             //                               BoxShadow(
//             //                                 color:
//             //                                     Colors.black.withOpacity(0.1),
//             //                                 blurRadius: 2.0,
//             //                                 spreadRadius: 0.0,
//             //                                 offset: Offset(2.0,
//             //                                     2.0), // shadow direction: bottom right
//             //                               )
//             //                             ],
//             //                           ),
//             //                           child: Card(
//             //                             elevation: 2,
//             //                             shape: RoundedRectangleBorder(
//             //                                 borderRadius:
//             //                                     BorderRadius.circular(20)),
//             //                             child: Container(
//             //                               height: 5,
//             //                               child: SingleChildScrollView(
//             //                                 child: Column(
//             //                                   children: [
//             //                                     CachedNetworkImage(
//             //                                         imageUrl: subject.thumbnail,
//             //                                         fit: BoxFit.cover,
//             //                                         errorWidget:
//             //                                             (context, url, error) =>
//             //                                                 SizedBox.shrink()),
//             //                                     Text(subject.subjectName)
//             //                                   ],
//             //                                 ),
//             //                               ),
//             //                             ),
//             //                           ),
//             //                         ),
//             //                       );
//             //                     }),
//             //       );
//             //     } else if (_controller.select2ndbtn == 1) {
//             //       return QuizeSubjectPage();
//             //     } else if (_controller.select2ndbtn == 2) {
//             //       return ModelSubjectPage();
//             //     } else {
//             //       return Container();
//             //     }
//             //   }),
//             // )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget hscbox(SubjectState subjectsState) {
//     return Container(
//       color: Color(0xffE5E5E5),
//       padding: EdgeInsets.symmetric(horizontal: 10),
//       child: subjectsState.loading
//           ? Center(child: CircularProgressIndicator())
//           : subjectsState.subjects.isEmpty
//               ? Center(child: Text('No course available'))
//               : GridView.builder(
//                   itemCount: subjectsState.subjects.length,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     mainAxisExtent: 241,
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 8,
//                     mainAxisSpacing: 5,
//                   ),
//                   itemBuilder: (BuildContext, index) {
//                     final subject = subjectsState.subjects[index];
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => CoursePage(
//                                       subject: Subject(
//                                           subject: subject,
//                                           courseName: ref.watch(
//                                               subjectProvider.select(
//                                                   (value) => value.className))),
//                                     )));
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.1),
//                               blurRadius: 2.0,
//                               spreadRadius: 0.0,
//                               offset: Offset(
//                                   2.0, 2.0), // shadow direction: bottom right
//                             )
//                           ],
//                         ),
//                         child: Card(
//                           elevation: 2,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20)),
//                           child: Container(
//                             height: 5,
//                             child: SingleChildScrollView(
//                               child: Column(
//                                 children: [
//                                   CachedNetworkImage(
//                                       imageUrl: subject.thumbnail,
//                                       fit: BoxFit.cover,
//                                       errorWidget: (context, url, error) =>
//                                           SizedBox.shrink()),
//                                   Text(subject.subjectName)
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   }),
//     );
//   }

//   Widget buttomnavbar() {
//     return BottomNavigationBar(
//       showSelectedLabels: false,
//       showUnselectedLabels: false,
//       items: [
//         // BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
//         // BottomNavigationBarItem(icon: Icon(Icons.person),label: "person"),
//         BottomNavigationBarItem(
//           icon: Image.asset(
//             PAssets.homeIcon,
//             scale: 16,
//           ),
//           label: "Home",
//         ),
//         BottomNavigationBarItem(
//           icon: Image.asset(
//             PAssets.serachIcon,
//             scale: 16,
//           ),
//           label: "search",
//         ),
//         BottomNavigationBarItem(
//           icon: Image.asset(
//             PAssets.playCircleIcon,
//             scale: 16,
//           ),
//           label: "play_circle",
//         ),
//         BottomNavigationBarItem(
//           icon: Image.asset(
//             PAssets.bookIcon,
//             scale: 16,
//           ),
//           label: "book",
//         ),
//         BottomNavigationBarItem(
//           icon: Image.asset(
//             PAssets.ringIcon,
//             scale: 16,
//           ),
//           label: "ring",
//         ),
//         BottomNavigationBarItem(
//           icon: Image.asset(
//             PAssets.personIcon,
//             scale: 16,
//           ),
//           label: "person",
//         ),
//       ],

//       type: BottomNavigationBarType.fixed,
//       currentIndex: 0,
//       backgroundColor: Colors.white,
//       // selectedItemColor: Colors.green,
//       unselectedItemColor: Colors.black,
//       // selectedIconTheme: IconThemeData(
//       //   color: Colors.redAccent
//       // ),

//       onTap: (int index) {
//         setState(() {
          
//         });
//       },
//     );
//   }
// }
