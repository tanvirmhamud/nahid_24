import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nahid_24/New_Design/Exam/quizelist.dart';

import '../../Http/Quize/quize.dart';
import '../../Model/examsubject.dart';
import '../../getx/selectbtn.dart';
import 'examtopic.dart';

class QuizeSubjectPage extends StatefulWidget {
  const QuizeSubjectPage({Key? key}) : super(key: key);

  @override
  State<QuizeSubjectPage> createState() => _QuizeSubjectPageState();
}

class _QuizeSubjectPageState extends State<QuizeSubjectPage> {
  final _controller = Get.put(Btncontroller());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_controller.examselectsubject.value == 898465456) {
        return modelsubject();
      } else {
        return ExamTopicPage(
          subjectid: _controller.examselectsubject.value,
        );
      }
    });
  }

  Widget modelsubject() {
    return Material(
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.grey[100],
        child: FutureBuilder<ExamSubject?>(
          future: HttpExam().getexam(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 6.0,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                shrinkWrap: true,
                itemCount: snapshot.data!.data!.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      _controller
                          .getselectsubject(snapshot.data!.data![index].id!);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text(
                        snapshot.data!.data![index].subjectName!,
                        style: TextStyle(color: Colors.white),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xFF0056DA),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  );
                }),
              );
              // return Obx(() {
              //   if (_controller.examselectsubject.value == 898465456) {

              //   } else {
              //     return Container();
              //     // return GridView.builder(
              //     //   physics: NeverScrollableScrollPhysics(),
              //     //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     //       crossAxisCount: 2,
              //     //       childAspectRatio: 6.0,
              //     //       crossAxisSpacing: 10,
              //     //       mainAxisSpacing: 10),
              //     //   shrinkWrap: true,
              //     //   itemCount: snapshot.data![_controller.selectsubject.value]
              //     //       .subjects!.length,
              //     //   itemBuilder: ((context, index) {
              //     //     var data = snapshot.data![_controller.selectsubject.value]
              //     //         .subjects![index];
              //     //     print(snapshot.data![1].subjects![index].topicName);
              //     //     return InkWell(
              //     //       onTap: () {
              //     //         Navigator.push(
              //     //             context,
              //     //             MaterialPageRoute(
              //     //                 builder: ((context) => QuizeListPage(
              //     //                     quizesubjectid: data.quizSubjectId!,
              //     //                     name: data.topicName!,
              //     //                     topicid: data.id!))));
              //     //       },
              //     //       child: Container(
              //     //         alignment: Alignment.center,
              //     //         width: double.infinity,
              //     //         child: Text(
              //     //           data.topicName!,
              //     //           style: TextStyle(color: Colors.white),
              //     //         ),
              //     //         decoration: BoxDecoration(
              //     //             color: Color(0xFF0056DA),
              //     //             borderRadius: BorderRadius.circular(10)),
              //     //       ),
              //     //     );
              //     //   }),
              //     // );
              //   }
              // });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ),
      ),
    );
  }
}
