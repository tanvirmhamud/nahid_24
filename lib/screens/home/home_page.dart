import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clean_api/clean_api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nahid_24/Http/Slider/slider.dart';
import 'package:nahid_24/New_Design/Exam/quizesubject.dart';
import 'package:nahid_24/New_Design/Model/model_subject.dart';
import 'package:nahid_24/application/course/course_provider.dart';
import 'package:nahid_24/application/subject/subject_provider.dart';
import 'package:nahid_24/getx/selectbtn.dart';
import 'package:nahid_24/screens/course/class_screen.dart';
import 'package:nahid_24/screens/course/course_page.dart';
import 'package:nahid_24/screens/courseVideo/course_info_screen.dart';
import 'package:nahid_24/screens/drawer/drawer.dart';
import 'package:nahid_24/screens/free_course/free_course.dart';
import 'package:nahid_24/screens/pages_we_created.dart';
import 'package:nahid_24/screens/quiz/quiz_page.dart';
import 'package:nahid_24/utils/constants/colors.dart';
import 'package:nahid_24/widget/quiz_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../New_Design/Jobvideo/jobvideo.dart';
import '../free_course/free_course_video.dart';
import '../paid_course/paid_course.dart';
import '../quiz/quizepage2.dart';

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends ConsumerState<HomeScreen> {
  final List<String> sImage = ["assets/silder.jpg", "assets/slider2.jpg"];

  final classes = {
    'এইচ এস সি': 'HSC_Video_Subject',
    'ভর্তি প্রস্তুতি': 'Admission_Video_Subject',
    'চাকরি প্রস্তুতি': 'Job_Video_Subject',
  };

  final _controller = Get.put(Btncontroller());

  int select2ndrow = 0;

  List<String> classname = [];

  @override
  void initState() {
    print("sdv bjasdbv ajsdhb ${classes.values.first}");
    classname.add("HSC_Video_Subject");
    Future.delayed(Duration(milliseconds: 100), () {
      ref
          .read(subjectProvider.notifier)
          .getSubjectsList(className: classes.values.first);
    });
    super.initState();
  }

  int jobpageshow = 0;

  @override
  Widget build(BuildContext context) {
    final subjectsState = ref.watch(subjectProvider);
    return Scaffold(
      backgroundColor: PColor.containerColor,
      drawer: Drawer(
        child: CustomDrawer(),
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
              height: 10,
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 115,
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Row(
                    children: classes
                        .map(
                          (key, value) => MapEntry(
                            key,
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  classname.clear();
                                  classname.add(value);

                                  ref.read(subjectProvider.notifier).getSubjectsList(className: value);
                                  _controller.change2ndbtn(0);

                                  setState(() {});
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(7),
                                  margin: EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: classname.contains(value)
                                          ? Colors.purple.withOpacity(0.9)
                                          : Color(0xf045de9).withOpacity(0.90)),
                                  child: Text(
                                    key,
                                    style: TextStyle(
                                        fontSize: 15.sp, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .values
                        .toList(),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              classname.clear();
                              classname.add("পেইড কোর্স");
                            });
                            _controller.change2ndbtn(4);
                            _controller
                                .selectmodelsubjectindex(01984651465655646);
                            _controller.getselectsubject(898465456);
                            // final int? id = await QuizDialogue.show(context);
                            // Logger.i("ok ok $id");
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (_) => QuizPage(
                            //               subjectId: 1,
                            //             )));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(7),
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.r),
                                color: classname.contains("পেইড কোর্স")
                                    ? Colors.purple.withOpacity(0.9)
                                    : Color(0xf045de9).withOpacity(0.90)),
                            child: Text(
                              "পেইড কোর্স",
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              classname.clear();
                              classname.add("লাইভ ক্লাস");
                            });
                            _controller.change2ndbtn(5);
                            _controller
                                .selectmodelsubjectindex(01984651465655646);
                            // final int? subjectId =
                            //     await ModelTestDialogue.show(context);
                            // Logger.i("ok ok $subjectId");
                            // if (subjectId != null) {
                            //   // Navigator.push(
                            //   //     context,
                            //   //     MaterialPageRoute(
                            //   //         builder: (_) => QuizPage(
                            //   //               subjectId: 1,
                            //   //             )));
                            //   final ModelTestTopicModel? topic =
                            //       await ModelTestTopicDialog.show(
                            //           context, subjectId);
                            //   Logger.i("topic id ${topic?.id}");
                            //   if (topic != null) {
                            //     Navigator.of(context).push(MaterialPageRoute(
                            //         builder: (_) => ModelTestPage(
                            //               titleId: int.parse(topic.title_id),
                            //               subjectId:
                            //                   int.parse(topic.test_subject_id),
                            //               topicId: topic.id,
                            //             )));
                            //   }
                            // }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(7),
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.r),
                                color: classname.contains("লাইভ ক্লাস")
                                    ? Colors.purple.withOpacity(0.9)
                                    : Color(0xf045de9).withOpacity(0.90)),
                            child: Text(
                              "লাইভ ক্লাস",
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              classname.clear();
                              classname.add("সাজেশন্স");
                            });
                            final int? id = await QuizDialogue.show(context);
                            // Logger.i("ok ok $id");
                            // if (id != null) {
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (_) => Quize2page(
                            //                 subjectid: id,
                            //               )));
                            // }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(7),
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.r),
                                color: classname.contains("সাজেশন্স")
                                    ? Colors.purple.withOpacity(0.9)
                                    : Color(0xf045de9).withOpacity(0.90)),
                            child: Text(
                              "সাজেশন্স",
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              classname.clear();
                              classname.add("পরীক্ষা");
                            });
                            _controller.change2ndbtn(1);
                            _controller
                                .selectmodelsubjectindex(01984651465655646);
                            _controller.getselectsubject(898465456);
                            // final int? id = await QuizDialogue.show(context);
                            // Logger.i("ok ok $id");
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (_) => QuizPage(
                            //               subjectId: 1,
                            //             )));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(7),
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.r),
                                color: classname.contains("পরীক্ষা")
                                    ? Colors.purple.withOpacity(0.9)
                                    : Color(0xf045de9).withOpacity(0.90)),
                            child: Text(
                              "পরীক্ষা",
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              classname.clear();
                              classname.add("মডেল টেস্ট");
                            });
                            _controller.change2ndbtn(2);
                            _controller
                                .selectmodelsubjectindex(01984651465655646);
                            // final int? subjectId =
                            //     await ModelTestDialogue.show(context);
                            // Logger.i("ok ok $subjectId");
                            // if (subjectId != null) {
                            //   // Navigator.push(
                            //   //     context,
                            //   //     MaterialPageRoute(
                            //   //         builder: (_) => QuizPage(
                            //   //               subjectId: 1,
                            //   //             )));
                            //   final ModelTestTopicModel? topic =
                            //       await ModelTestTopicDialog.show(
                            //           context, subjectId);
                            //   Logger.i("topic id ${topic?.id}");
                            //   if (topic != null) {
                            //     Navigator.of(context).push(MaterialPageRoute(
                            //         builder: (_) => ModelTestPage(
                            //               titleId: int.parse(topic.title_id),
                            //               subjectId:
                            //                   int.parse(topic.test_subject_id),
                            //               topicId: topic.id,
                            //             )));
                            //   }
                            // }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(7),
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.r),
                                color: classname.contains("মডেল টেস্ট")
                                    ? Colors.purple.withOpacity(0.9)
                                    : Color(0xf045de9).withOpacity(0.90)),
                            child: Text(
                              "মডেল টেস্ট",
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              classname.clear();
                              classname.add("কুইজ");
                            });
                            final int? id = await QuizDialogue.show(context);
                            // Logger.i("ok ok $id");
                            // if (id != null) {
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (_) => Quize2page(
                            //                 subjectid: id,
                            //               )));
                            // }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(7),
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3.r),
                                color: classname.contains("কুইজ")
                                    ? Colors.purple.withOpacity(0.9)
                                    : Color(0xf045de9).withOpacity(0.90)),
                            child: Text(
                              "কুইজ",
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 10),
            //   color: Color(0xffE5E5E5),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       TextButton(
            //           onPressed: () {},
            //           child: Text(
            //             "Courses",
            //             style: TextStyle(
            //                 fontWeight: FontWeight.bold, fontSize: 18),
            //           )),
            //       TextButton(
            //           onPressed: () {},
            //           child: Text(
            //             "See all",
            //             style: TextStyle(
            //                 fontWeight: FontWeight.bold, fontSize: 18),
            //           ))
            //     ],
            //   ),
            // ),

            Expanded(
              child: Obx(() {
                if (_controller.select2ndbtn == 0) {
                  // return Container(
                  //   color: Colors.grey[200],
                  //   padding: EdgeInsets.symmetric(horizontal: 10),
                  //   child: SingleChildScrollView(
                  //     child: Column(
                  //       children: [
                  //         SizedBox(height: 5),
                  //         Row(
                  //           children: [
                  //             Text(
                  //               "Courses",
                  //               style: TextStyle(
                  //                   color: Colors.indigo,
                  //                   fontSize: 17,
                  //                   fontWeight: FontWeight.bold),
                  //             ),
                  //             Spacer(),
                  //             Text(
                  //               "See All",
                  //               style: TextStyle(
                  //                   color: Colors.indigo,
                  //                   fontSize: 17,
                  //                   fontWeight: FontWeight.bold),
                  //             )
                  //           ],
                  //         ),
                  //         SizedBox(height: 5),
                  //         subjectsState.loading
                  //             ? Center(child: CircularProgressIndicator())
                  //             : subjectsState.subjects.isEmpty
                  //                 ? Center(child: Text('No course available'))
                  //                 : GridView.builder(
                  //                     shrinkWrap: true,
                  //                     physics: NeverScrollableScrollPhysics(),
                  //                     itemCount: subjectsState.subjects.length,
                  //                     gridDelegate:
                  //                         SliverGridDelegateWithFixedCrossAxisCount(
                  //                       crossAxisCount: 2,
                  //                       childAspectRatio: 0.78,
                  //                       crossAxisSpacing: 8,
                  //                       mainAxisSpacing: 5,
                  //                     ),
                  //                     itemBuilder: (BuildContext, index) {
                  //                       final subject =
                  //                           subjectsState.subjects[index];
                  //                       return Container(
                  //                         decoration: BoxDecoration(
                  //                             color: Colors.white,
                  //                             borderRadius:
                  //                                 BorderRadius.circular(10)),
                  //                         child: GestureDetector(
                  //                           onTap: () {
                  //                             Navigator.push(
                  //                               context,
                  //
                  //                               MaterialPageRoute(
                  //                                 builder: (_) => CourseInfoScreen(
                  //                                   subject: Subject(
                  //                                     subject: subject,
                  //                                     courseName: ref.watch(
                  //                                       subjectProvider.select(
                  //                                         (value) =>
                  //                                             value.className,
                  //                                       ),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //
                  //                               ),
                  //                             );
                  //                           },
                  //                           child: Container(
                  //                             height: 205,
                  //                             width: double.infinity,
                  //                             decoration: BoxDecoration(
                  //                               borderRadius:
                  //                                   BorderRadius.circular(20),
                  //                             ),
                  //                             child: ClipRRect(
                  //                               borderRadius:
                  //                                   BorderRadius.circular(10),
                  //                               child: CachedNetworkImage(
                  //                                   imageUrl: subject.thumbnail,
                  //                                   fit: BoxFit.cover,
                  //                                   errorWidget:
                  //                                       (context, url, error) =>
                  //                                           SizedBox.shrink()),
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       );
                  //                     },
                  //                   ),
                  //       ],
                  //     ),
                  //   ),
                  // );
                  return coursesui(false);
                } else if (_controller.select2ndbtn == 1) {
                  return QuizeSubjectPage();
                } else if (_controller.select2ndbtn == 2) {
                  return ModelSubjectPage();

                } else if (_controller.select2ndbtn == 4 ||
                    _controller.select2ndbtn == 5) {
                  return coursesui(true);
                } else {
                  return Container();
                }
              }),
            ),

          ],
        ),
      ),
    );
  }

  Widget coursesui(bool valueHide) {
    return SingleChildScrollView(
      child: Container(
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
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  "Courses",
                  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  "Sell All",
                  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(height: 5),
            GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .86,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: (){ !valueHide ? Navigator.push(context, MaterialPageRoute(builder: (_) =>   FreeCourseVideo())):Navigator.push(context, MaterialPageRoute(builder: (_) => PaidCourse()));        },
                    child:  Stack(
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
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          // color: Colors.amber,
                                          borderRadius:
                                          BorderRadius.circular(10.0),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/course_bg.jpeg"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(visible : valueHide, child:  Positioned(
                                      right: -8.0,
                                      bottom: 10.0,
                                      child: Container(
                                        height: 25.0,
                                        width: 70.0,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: PColor.submitButtonColorBlue,
                                          borderRadius:
                                          BorderRadius.circular(30.0),
                                        ),
                                        child: Text(
                                          "৳ ৩০০০",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),),

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
                                      fontSize: 16.sp, color: Colors.grey),
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
          ],
        ),
      ),
    );
  }
}