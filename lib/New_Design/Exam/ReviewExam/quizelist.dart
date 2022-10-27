import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nahid_24/New_Design/Exam/scorebord.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

import '../../../Http/Quize/quize.dart';
import '../../../Model/quizelist.dart';
import '../../../Model/submitmodel.dart';
import '../../../getx/selectbtn.dart';

class ReviewQuizeListPage extends StatefulWidget {
  final int topicid;
  final String quizesubjectid;
  final String name;
  const ReviewQuizeListPage(
      {Key? key,
      required this.topicid,
      required this.quizesubjectid,
      required this.name})
      : super(key: key);

  @override
  State<ReviewQuizeListPage> createState() => _ReviewQuizeListPageState();
}

class _ReviewQuizeListPageState extends State<ReviewQuizeListPage> {
  final _controller = Get.put(Btncontroller());

  final audiplayer = AudioPlayer();

  int questionlength = 0;

  double getscore({int? right_ans, int? wrong}) {
    double score = ((right_ans! * 1) - wrong! * 0.25).toDouble();

    return score;
  }

  @override
  void dispose() {
    audiplayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),

        // actions: [
        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       SizedBox(width: 10),
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Obx(() {
        //             if (_controller.showquizerigthanwser.value == true) {
        //               return Text(
        //                   "Rigth anwser: ${_controller.quizetotalqurrect.length}");
        //             } else {
        //               return Text("Rigth anwser: 0");
        //             }
        //           }),
        //           Obx(() {
        //             if (_controller.showquizerigthanwser.value == true) {
        //               return Text(
        //                   "Wrong anwser: ${questionlength - _controller.quizetotalqurrect.length}");
        //             } else {
        //               return Text("Wrong anwser: 0");
        //             }
        //           }),
        //           Obx(() {
        //             if (_controller.showquizerigthanwser.value == true) {
        //               return Text(
        //                   "Score: ${getscore(right_ans: _controller.quizetotalqurrect.length, wrong: questionlength - _controller.quizetotalqurrect.length)}");
        //             } else {
        //               return Text("Score: 0");
        //             }
        //           }),
        //         ],
        //       ),
        //       SizedBox(width: 10),
        //     ],
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: Scrollbar(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                FutureBuilder<QuizeList?>(
                    future: HttpExam().getquizelist(widget.topicid),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        questionlength = snapshot.data!.data!.length;
                        return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.data!.length,
                            itemBuilder: ((context, index) {
                              var data = snapshot.data!.data![index];
                              return Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width: double.infinity,
                                    margin:
                                        EdgeInsets.only(bottom: 10, top: 10),
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      data.question!,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color(0xFF0056DA),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  Singlequestion(data: data, index: index)
                                ],
                              );
                            }));
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    })),
                // MaterialButton(
                //   color: Colors.indigo,
                //   onPressed: () {
                //     HttpQuize()
                //         .quizesubmit(
                //             quiz_subject_id: int.parse(widget.quizesubjectid),
                //             quiz_topics_id: widget.topicid,
                //             subjectmodel: _controller.quizesubmitmodelques)
                //         .then((value) => _controller.quizeshowanwser())
                //         .then((value) => Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: ((context) => ExamScoreboardPage(
                //                       name: widget.name,
                //                       quizesubjectid: widget.quizesubjectid,
                //                       topicid: widget.topicid,
                //                       score: getscore(
                //                               right_ans: _controller
                //                                   .quizetotalqurrect.length,
                //                               wrong: questionlength -
                //                                   _controller
                //                                       .quizetotalqurrect.length)
                //                           .toString(),
                //                       complete: complete(),
                //                       correct: _controller
                //                           .quizetotalqurrect.length
                //                           .toString(),
                //                       total: questionlength.toString(),
                //                       wrong: (questionlength -
                //                               _controller
                //                                   .quizetotalqurrect.length)
                //                           .toString(),
                //                     )))))
                //         .then((value) {
                //       Future.delayed(Duration(milliseconds: 500), () {
                //         setState(() {
                //           _controller.quizetimechange(4);
                //         });
                //       });
                //     });
                //   },
                //   child: Text(
                //     "Submit",
                //     style: TextStyle(color: Colors.white),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Singlequestion extends StatefulWidget {
  final Datum data;
  final int index;
  const Singlequestion({Key? key, required this.data, required this.index})
      : super(key: key);

  @override
  State<Singlequestion> createState() => _SinglequestionState();
}

class _SinglequestionState extends State<Singlequestion> {
  String selectans = "";

  final _controller = Get.put(Btncontroller());

  final audiplayer = AudioPlayer();

  Color identifyanser(question) {
    if (_controller.quizesubmitmodelques
        .any((element) => element.id == widget.data.id)) {
      if (question == widget.data.correctAns) {
        return Colors.green;
      } else if (_controller.quizesubmitmodelques.any((element) =>
          element.id == widget.data.id && element.submitAns != question)) {
        return Colors.white;
      } else {
        return Colors.red;
      }
    } else {
      return Colors.white;
    }
  }

  @override
  void dispose() {
    audiplayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Obx(() {
          return InkWell(
            onTap: () {},
            child: Card(
              color: widget.data.option1 == widget.data.correctAns
                  ? Colors.green
                  : identifyanser(widget.data.option1),
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Text("${widget.data.option1!}",
                    style: TextStyle(
                        color: identifyanser(widget.data.option1) ==
                                    Colors.red ||
                                widget.data.option1 == widget.data.correctAns
                            ? Colors.white
                            : Colors.black)),
              ),
            ),
          );
        }),
        Obx(() {
          return InkWell(
            onTap: () {},
            child: Card(
              color: widget.data.option2 == widget.data.correctAns
                  ? Colors.green
                  : identifyanser(widget.data.option2),
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Text("${widget.data.option2!}",
                    style: TextStyle(
                        color: identifyanser(widget.data.option2) ==
                                    Colors.red ||
                                widget.data.option2 == widget.data.correctAns
                            ? Colors.white
                            : Colors.black)),
              ),
            ),
          );
        }),
        Obx(() {
          return InkWell(
            onTap: () {},
            child: Card(
              color: widget.data.option3 == widget.data.correctAns
                  ? Colors.green
                  : identifyanser(widget.data.option3),
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Text("${widget.data.option3!}",
                    style: TextStyle(
                        color: identifyanser(widget.data.option3) ==
                                    Colors.red ||
                                widget.data.option3 == widget.data.correctAns
                            ? Colors.white
                            : Colors.black)),
              ),
            ),
          );
        }),
        Obx(() {
          return InkWell(
            onTap: () {},
            child: Card(
              color: widget.data.option4 == widget.data.correctAns
                  ? Colors.green
                  : identifyanser(widget.data.option4),
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "${widget.data.option4!}",
                  style: TextStyle(
                      color: identifyanser(widget.data.option4) == Colors.red ||
                              widget.data.option4 == widget.data.correctAns
                          ? Colors.white
                          : Colors.black),
                ),
              ),
            ),
          );
        })
      ],
    );
  }
}
