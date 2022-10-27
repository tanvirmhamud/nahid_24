import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nahid_24/Route/push.dart';
import 'package:provider/provider.dart';
import '../../Http/Slider/slider.dart';
import '../../New_Design/Exam/quizesubject.dart';
import '../../New_Design/Homepage_design/Free_course/free_course.dart';
import '../../New_Design/Homepage_design/Live_Class/live_class.dart';
import '../../New_Design/Homepage_design/Paid_Exam/paidexam.dart';
import '../../New_Design/Homepage_design/Paid_course/paid_course.dart';
import '../../New_Design/Model/model_subject.dart';
import '../../New_Design/Suggestion/suggestionlist.dart';
import '../../New_Design/product/books_screen.dart';
import '../../Provider/homepage.dart';
import '../../getx/selectbtn.dart';
import '../../utils/constants/colors.dart';
import '../../widget/quiz_dialogue.dart';
import '../../New_Design/Homepage_design/Free_course/free_course_video.dart';
import '../drawer/drawer.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> sImage = ["assets/silder.jpg", "assets/slider2.jpg"];

  PageController pageController = PageController();

  final classes = {
    'ফ্রি কোর্স': 'HSC_Video_Subject',
    'পেইড কোর্স': 'Admission_Video_Subject',
    'লাইভ ক্লাস': 'Job_Video_Subject',
  };

  final _controller = Get.put(Btncontroller());

  int select2ndrow = 0;

  int btnindex = 0;

  List<String> classname = [];

  bool loading = false;

  Future loaddata(String apipath) async {
    setState(() {
      loading = true;
    });
    final provider = Provider.of<HomeProvider>(context, listen: false);
    await provider.getsubjectlist(apipath: apipath);
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    loaddata(classes.values.first);
    // print("sdv bjasdbv ajsdhb ${classes.values.first}");
    // classname.add("HSC_Video_Subject");
    // Future.delayed(Duration(milliseconds: 100), () {
    //   ref
    //       .read(subjectProvider.notifier)
    //       .getSubjectsList(className: classes.values.first);
    // });
    super.initState();
  }

  int jobpageshow = 0;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    // final subjectsState = ref.watch(subjectProvider);
    return Scaffold(
      backgroundColor: PColor.containerColor,
      drawer: Drawer(
        child: Customdrawer(),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xf045de9).withOpacity(0.7),
        elevation: 0,
        toolbarHeight: 50.h,
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
        child: Column(
          children: [
            slider(),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 131.h,
              child: Column(
                children: [
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Expanded(
                        child: button(
                            name: "ফ্রি কোর্স",
                            onTap: () {
                              setState(() {
                                btnindex = 0;
                                pageController.jumpToPage(0);
                              });
                            },
                            btnindex2: 0),
                      ),
                      Expanded(
                        child: button(
                            name: "পেইড কোর্স",
                            onTap: () {
                              setState(() {
                                btnindex = 1;
                                pageController.jumpToPage(1);
                              });
                            },
                            btnindex2: 1),
                      ),
                      Expanded(
                        child: button(
                            name: "লাইভ ক্লাস",
                            onTap: () {
                              setState(() {
                                btnindex = 2;
                                pageController.jumpToPage(2);
                              });
                            },
                            btnindex2: 2),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Expanded(
                        child: button(
                            name: "পরীক্ষা",
                            onTap: () {
                              setState(() {
                                btnindex = 3;
                                pageController.jumpToPage(3);
                              });
                            },
                            btnindex2: 3),
                      ),
                      Expanded(
                        child: button(
                            name: "মডেল টেস্ট",
                            onTap: () {
                              setState(() {
                                btnindex = 4;
                                pageController.jumpToPage(4);
                              });
                            },
                            btnindex2: 4),
                      ),
                      Expanded(
                        child: button(
                            name: "কুইজ",
                            onTap: () {
                              setState(() {
                                // btnindex = 5;
                                // pageController.jumpToPage(5);
                                showDialog(
                                  context: context,
                                  builder: (context) => QuizeDialogue(),
                                );
                              });
                            },
                            btnindex2: 5),
                      ),
                    ],
                  ),
                  // Row(
                  //   children: classes
                  //       .map(
                  //         (key, value) => MapEntry(
                  //           key,
                  //           Expanded(
                  //             child: InkWell(
                  //               onTap: () {
                  //                 pageController.jumpToPage(0);
                  //                 classname.clear();
                  //                 classname.add(value);
                  //                 loaddata(value);
                  //                 // ref
                  //                 //     .read(subjectProvider.notifier)
                  //                 //     .getSubjectsList(className: value);

                  //                 _controller.change2ndbtn(0);

                  //                 setState(() {});
                  //               },
                  //               child: Container(
                  //                 alignment: Alignment.center,
                  //                 padding: EdgeInsets.all(7),
                  //                 margin: EdgeInsets.symmetric(horizontal: 4),
                  //                 decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(3),
                  //                     color: classname.contains(value)
                  //                         ? Colors.purple.withOpacity(0.9)
                  //                         : Color(0xf045de9).withOpacity(0.90)),
                  //                 child: Text(
                  //                   key,
                  //                   style: TextStyle(
                  //                       fontSize: 15.sp, color: Colors.white),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       )
                  //       .values
                  //       .toList(),
                  // ),
                  SizedBox(height: 5.h),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: InkWell(
                  //         onTap: () {
                  //           pageController.jumpToPage(1);
                  //           setState(() {
                  //             classname.clear();
                  //             classname.add("পরীক্ষা");
                  //           });
                  //           _controller.change2ndbtn(1);
                  //           _controller
                  //               .selectmodelsubjectindex(01984651465655646);
                  //           _controller.getselectsubject(898465456);
                  //           // final int? id = await QuizDialogue.show(context);
                  //           // Logger.i("ok ok $id");
                  //           // Navigator.push(
                  //           //     context,
                  //           //     MaterialPageRoute(
                  //           //         builder: (_) => QuizPage(
                  //           //               subjectId: 1,
                  //           //             )));
                  //         },
                  //         child: Container(
                  //           alignment: Alignment.center,
                  //           padding: EdgeInsets.all(7),
                  //           margin: EdgeInsets.symmetric(horizontal: 4),
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(3.r),
                  //               color: classname.contains("পরীক্ষা")
                  //                   ? Colors.purple.withOpacity(0.9)
                  //                   : Color(0xf045de9).withOpacity(0.90)),
                  //           child: Text(
                  //             "পরীক্ষা",
                  //             style: TextStyle(
                  //                 fontSize: 15.sp, color: Colors.white),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: InkWell(
                  //         onTap: () {
                  //           pageController.jumpToPage(2);
                  //           setState(() {
                  //             classname.clear();
                  //             classname.add("মডেল টেস্ট");
                  //           });
                  //           _controller.change2ndbtn(2);
                  //           _controller
                  //               .selectmodelsubjectindex(01984651465655646);
                  //           // final int? subjectId =
                  //           //     await ModelTestDialogue.show(context);
                  //           // Logger.i("ok ok $subjectId");
                  //           // if (subjectId != null) {
                  //           //   // Navigator.push(
                  //           //   //     context,
                  //           //   //     MaterialPageRoute(
                  //           //   //         builder: (_) => QuizPage(
                  //           //   //               subjectId: 1,
                  //           //   //             )));
                  //           //   final ModelTestTopicModel? topic =
                  //           //       await ModelTestTopicDialog.show(
                  //           //           context, subjectId);
                  //           //   Logger.i("topic id ${topic?.id}");
                  //           //   if (topic != null) {
                  //           //     Navigator.of(context).push(MaterialPageRoute(
                  //           //         builder: (_) => ModelTestPage(
                  //           //               titleId: int.parse(topic.title_id),
                  //           //               subjectId:
                  //           //                   int.parse(topic.test_subject_id),
                  //           //               topicId: topic.id,
                  //           //             )));
                  //           //   }
                  //           // }
                  //         },
                  //         child: Container(
                  //           alignment: Alignment.center,
                  //           padding: EdgeInsets.all(7),
                  //           margin: EdgeInsets.symmetric(horizontal: 4),
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(3.r),
                  //               color: classname.contains("মডেল টেস্ট")
                  //                   ? Colors.purple.withOpacity(0.9)
                  //                   : Color(0xf045de9).withOpacity(0.90)),
                  //           child: Text(
                  //             "মডেল টেস্ট",
                  //             style: TextStyle(
                  //                 fontSize: 15.sp, color: Colors.white),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: InkWell(
                  //         onTap: () async {
                  //           setState(() {
                  //             classname.clear();
                  //             classname.add("কুইজ");
                  //           });
                  //           showDialog(
                  //             context: context,
                  //             builder: (context) => QuizeDialogue(),
                  //           );
                  //           // final int? id = await QuizDialogue.show(context);
                  //           // Logger.i("ok ok $id");
                  //           // if (id != null) {
                  //           //   Navigator.push(
                  //           //       context,
                  //           //       MaterialPageRoute(
                  //           //           builder: (_) => Quize2page(
                  //           //                 subjectid: id,
                  //           //               )));
                  //           // }
                  //         },
                  //         child: Container(
                  //           alignment: Alignment.center,
                  //           padding: EdgeInsets.all(7),
                  //           margin: EdgeInsets.symmetric(horizontal: 4),
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(3.r),
                  //               color: classname.contains("কুইজ")
                  //                   ? Colors.purple.withOpacity(0.9)
                  //                   : Color(0xf045de9).withOpacity(0.90)),
                  //           child: Text(
                  //             "কুইজ",
                  //             style: TextStyle(
                  //                 fontSize: 15.sp, color: Colors.white),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  Row(
                    children: [
                      Expanded(
                        child: button(
                            name: "পেইড পরীক্ষা",
                            onTap: () {
                              setState(() {
                                btnindex = 6;
                                pageController.jumpToPage(6);
                              });
                            },
                            btnindex2: 6),
                      ),
                      Expanded(
                        child: button(
                            name: "সাজেশন্স",
                            onTap: () {
                              setState(() {
                                btnindex = 7;
                                pageController.jumpToPage(7);
                              });
                            },
                            btnindex2: 7),
                      ),
                      Expanded(
                        child: button(
                            name: "বইসমূহ",
                            onTap: () {
                              setState(() {
                                // btnindex = 8;
                                // pageController.jumpToPage(8);
                                newscreen(BookScreen(), context);
                              });
                            },
                            btnindex2: 8),
                      ),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: InkWell(
                  //         onTap: () {
                  //           pageController.jumpToPage(4);
                  //           setState(() {
                  //             classname.clear();
                  //             classname.add("পেইড পরীক্ষা");
                  //           });
                  //           _controller.change2ndbtn(4);
                  //           _controller
                  //               .selectmodelsubjectindex(01984651465655646);
                  //           _controller.getselectsubject(898465456);
                  //           // final int? id = await QuizDialogue.show(context);
                  //           // Logger.i("ok ok $id");
                  //           // Navigator.push(
                  //           //     context,
                  //           //     MaterialPageRoute(
                  //           //         builder: (_) => QuizPage(
                  //           //               subjectId: 1,
                  //           //             )));
                  //         },
                  //         child: Container(
                  //           alignment: Alignment.center,
                  //           padding: EdgeInsets.all(7),
                  //           margin: EdgeInsets.symmetric(horizontal: 4),
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(3.r),
                  //               color: classname.contains("পেইড পরীক্ষা")
                  //                   ? Colors.purple.withOpacity(0.9)
                  //                   : Color(0xf045de9).withOpacity(0.90)),
                  //           child: Text(
                  //             "পেইড পরীক্ষা",
                  //             style: TextStyle(
                  //                 fontSize: 15.sp, color: Colors.white),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: InkWell(
                  //         onTap: () {
                  //           setState(() {
                  //             classname.clear();
                  //             classname.add("সাজেশন্স");
                  //           });
                  //           _controller.change2ndbtn(5);
                  //           _controller
                  //               .selectmodelsubjectindex(01984651465655646);
                  //           // final int? subjectId =
                  //           //     await ModelTestDialogue.show(context);
                  //           // Logger.i("ok ok $subjectId");
                  //           // if (subjectId != null) {
                  //           //   // Navigator.push(
                  //           //   //     context,
                  //           //   //     MaterialPageRoute(
                  //           //   //         builder: (_) => QuizPage(
                  //           //   //               subjectId: 1,
                  //           //   //             )));
                  //           //   final ModelTestTopicModel? topic =
                  //           //       await ModelTestTopicDialog.show(
                  //           //           context, subjectId);
                  //           //   Logger.i("topic id ${topic?.id}");
                  //           //   if (topic != null) {
                  //           //     Navigator.of(context).push(MaterialPageRoute(
                  //           //         builder: (_) => ModelTestPage(
                  //           //               titleId: int.parse(topic.title_id),
                  //           //               subjectId:
                  //           //                   int.parse(topic.test_subject_id),
                  //           //               topicId: topic.id,
                  //           //             )));
                  //           //   }
                  //           // }
                  //         },
                  //         child: Container(
                  //           alignment: Alignment.center,
                  //           padding: EdgeInsets.all(7),
                  //           margin: EdgeInsets.symmetric(horizontal: 4),
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(3.r),
                  //               color: classname.contains("সাজেশন্স")
                  //                   ? Colors.purple.withOpacity(0.9)
                  //                   : Color(0xf045de9).withOpacity(0.90)),
                  //           child: Text(
                  //             "সাজেশন্স",
                  //             style: TextStyle(
                  //                 fontSize: 15.sp, color: Colors.white),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: InkWell(
                  //         onTap: () async {
                  //           setState(() {
                  //             classname.clear();
                  //             classname.add("বইসমূহ");
                  //           });

                  //           // showDialog(
                  //           //   context: context,
                  //           //   builder: (context) => QuizeDialogue(),
                  //           // );
                  //           // final int? id = await QuizeDialogue.show(context);
                  //           // Logger.i("ok ok $id");
                  //           // if (id != null) {
                  //           //   Navigator.push(
                  //           //       context,
                  //           //       MaterialPageRoute(
                  //           //           builder: (_) => Quize2page(
                  //           //                 subjectid: id,
                  //           //               )));
                  //           // }
                  //         },
                  //         child: Container(
                  //           alignment: Alignment.center,
                  //           padding: EdgeInsets.all(7),
                  //           margin: EdgeInsets.symmetric(horizontal: 4),
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(3.r),
                  //               color: classname.contains("বইসমূহ")
                  //                   ? Colors.purple.withOpacity(0.9)
                  //                   : Color(0xf045de9).withOpacity(0.90)),
                  //           child: Text(
                  //             "বইসমূহ",
                  //             style: TextStyle(
                  //                 fontSize: 15.sp, color: Colors.white),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Flexible(
              child: PageView(
                controller: pageController,
                children: [
                  FreeCoursePage(valueHide: false),

                  PaidCoursePage(valueHide: true),
                  LiveClassspage(valueHide: true),
                  // FreeCoursePage(valueHide: false),
                  QuizeSubjectPage(),
                  ModelSubjectPage(),
                  Container(),
                  // coursesui2(false),
                  PaidExamPage(),
                  SuggestionListpage(),

                  Container(),
                ],
              ),
            )
            // Expanded(
            //   child: Obx(() {
            //     if (_controller.select2ndbtn == 0) {
            //       return coursesui(false);
            //     } else if (_controller.select2ndbtn == 1) {
            //       return QuizeSubjectPage();
            //     } else if (_controller.select2ndbtn == 2) {
            //       return ModelSubjectPage();
            //     } else if (_controller.select2ndbtn == 4 ||
            //         _controller.select2ndbtn == 5) {
            //       return PaidExamPage();
            //     } else {
            //       return Container();
            //     }
            //   }),
            // ),
          ],
        ),
      ),
    );
  }

  Widget slider() {
    return FutureBuilder<dynamic>(
        future: HttpSlider().getslider(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            return Container(
              color: Colors.white,
              width: double.infinity,
              height: 120.h,
              child: CarouselSlider(
                  options: CarouselOptions(
                      autoPlayInterval: Duration(seconds: 10),
                      viewportFraction: 1.0,
                      enableInfiniteScroll: false,
                      initialPage: 0,
                      aspectRatio: 0.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      height: 120.h),
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
        }));
  }

  Widget coursesui(bool valueHide) {
    final provider = Provider.of<HomeProvider>(context);
    return loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            color: Colors.grey[200],
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
                      "Courses",
                      style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "Sell All",
                      style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(height: 5.h),
                Expanded(
                  child: GridView.builder(
                      itemCount: provider.subjectlist!.data!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .86,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: ((context, index) {
                        var data = provider.subjectlist!.data![index];
                        return InkWell(
                          onTap: () {
                            // !valueHide
                            //     ? Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (_) => FreeCourseVideo()))
                            //     : Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (_) => PaidCourse()));

                            pageController.jumpToPage(3);
                          },
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 150.h,
                                      width: double.infinity,
                                      margin: EdgeInsets.only(
                                          left: 10.w, right: 10.w, top: 10.h),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
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
                                            visible: valueHide,
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
                                                    fontWeight: FontWeight.w500,
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
                                        "বিসিএস প্রিলি কোর্স",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20.sp),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "কে এম রাফসান রাব",
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
          );
  }

  Widget coursesui2(bool valueHide) {
    final provider = Provider.of<HomeProvider>(context);
    return loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            color: Colors.grey[200],
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
                    InkWell(
                        onTap: () {
                          pageController.jumpToPage(0);
                        },
                        child: Icon(Icons.arrow_back)),
                    SizedBox(width: 10.w),
                    Text(
                      "ফ্রি কোর্স",
                      style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "এইচ এস সি",
                      style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(height: 5.h),
                Expanded(
                  child: GridView.builder(
                      itemCount: provider.subjectlist!.data!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .86,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: ((context, index) {
                        var data = provider.subjectlist!.data![index];
                        return InkWell(
                          onTap: () {
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
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 150.h,
                                      width: double.infinity,
                                      margin: EdgeInsets.only(
                                          left: 10.w, right: 10.w, top: 10.h),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
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
                                            visible: valueHide,
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
                                                    fontWeight: FontWeight.w500,
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
                                        "বিসিএস প্রিলি কোর্স",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20.sp),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "কে এম রাফসান রাব",
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
          );
  }

  Widget button({String? name, GestureTapCallback? onTap, int? btnindex2}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(7),
        margin: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: btnindex2 == btnindex
              ? Colors.purple.withOpacity(0.9)
              : Color(0xf045de9).withOpacity(0.90),
        ),
        child: Text(
          name!,
          style: TextStyle(fontSize: 15.sp, color: Colors.white),
        ),
      ),
    );
  }
}
