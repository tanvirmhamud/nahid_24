import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nahid_24/New_Design/Exam/scorebord.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

import '../../Http/Quize/quize.dart';
import '../../Model/quizelist.dart';
import '../../Model/submitmodel.dart';
import '../../getx/selectbtn.dart';

class QuizeListPage extends StatefulWidget {
  final int topicid;
  final String quizesubjectid;
  final String name;
  const QuizeListPage(
      {Key? key,
      required this.topicid,
      required this.quizesubjectid,
      required this.name})
      : super(key: key);

  @override
  State<QuizeListPage> createState() => _QuizeListPageState();
}

class _QuizeListPageState extends State<QuizeListPage> {
  final _controller = Get.put(Btncontroller());

  @override
  void initState() {
    _controller.clearall();

    super.initState();
  }

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
        leadingWidth: 80,
        leading: Obx((() {
          if (_controller.examtime.value == 0) {
            return Container();
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SlideCountdownSeparated(
                  duration: Duration(minutes: _controller.examtime.value),
                  onDone: () async {
                    await HttpQuize().examsubmit(
                        quiz_subject_id: widget.quizesubjectid,
                        quiz_topics_id: widget.topicid.toString(),
                        subjectmodel: _controller.quizesubmitmodelques);

                    var current = _controller.quizesubmitmodelques
                        .where((p0) => p0.submitAns == p0.rightAns)
                        .toList();
                    var wrong = _controller.quizesubmitmodelques
                        .where((p0) => p0.submitAns != p0.rightAns)
                        .toList();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => ExamScoreboardPage(
                                  name: widget.name,
                                  quizesubjectid: widget.quizesubjectid,
                                  topicid: widget.topicid,
                                  total: questionlength.toString(),
                                  correct: current.length,
                                  wrong: wrong.length,
                                  score: getscore(
                                          right_ans: current.length,
                                          wrong: wrong.length)
                                      .toString(),
                                  complete: _controller
                                      .quizesubmitmodelques.length
                                      .toString(),
                                )))).then((value) {
                      Future.delayed(Duration(milliseconds: 500), () {
                        setState(() {
                          _controller.examtimechange(5);
                        });
                      });
                    });
                  },
                ),
              ],
            );
          }
        })),
        actions: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     SizedBox(width: 10),
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Obx(() {
          //           if (_controller.showquizerigthanwser.value == true) {
          //             return Text(
          //                 "Rigth anwser: ${_controller.quizetotalqurrect.length}");
          //           } else {
          //             return Text("Rigth anwser: 0");
          //           }
          //         }),
          //         Obx(() {
          //           if (_controller.showquizerigthanwser.value == true) {
          //             return Text(
          //                 "Wrong anwser: ${questionlength - _controller.quizetotalqurrect.length}");
          //           } else {
          //             return Text("Wrong anwser: 0");
          //           }
          //         }),
          //         Obx(() {
          //           if (_controller.showquizerigthanwser.value == true) {
          //             return Text(
          //                 "Score: ${getscore(right_ans: _controller.quizetotalqurrect.length, wrong: questionlength - _controller.quizetotalqurrect.length)}");
          //           } else {
          //             return Text("Score: 0");
          //           }
          //         }),
          //       ],
          //     ),
          //     SizedBox(width: 10),
          //   ],
          // )
        ],
      ),
      body: SingleChildScrollView(
        child: Scrollbar(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                FutureBuilder<QuizeList?>(
                    future: HttpQuize().getquizelist(widget.topicid),
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
                MaterialButton(
                  color: Colors.indigo,
                  onPressed: () async {
                    await HttpQuize().examsubmit(
                        quiz_subject_id: widget.quizesubjectid,
                        quiz_topics_id: widget.topicid.toString(),
                        subjectmodel: _controller.quizesubmitmodelques);

                    var current = _controller.quizesubmitmodelques
                        .where((p0) => p0.submitAns == p0.rightAns)
                        .toList();
                    var wrong = _controller.quizesubmitmodelques
                        .where((p0) => p0.submitAns != p0.rightAns)
                        .toList();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => ExamScoreboardPage(
                                  name: widget.name,
                                  quizesubjectid: widget.quizesubjectid,
                                  topicid: widget.topicid,
                                  total: questionlength.toString(),
                                  correct: current.length,
                                  wrong: wrong.length,
                                  score: getscore(
                                          right_ans: current.length,
                                          wrong: wrong.length)
                                      .toString(),
                                  complete: _controller
                                      .quizesubmitmodelques.length
                                      .toString(),
                                )))).then((value) {
                      Future.delayed(Duration(milliseconds: 500), () {
                        setState(() {
                          _controller.examtimechange(5);
                        });
                      });
                    });
                    // HttpQuize()
                    //     .examsubmit(
                    //         quiz_subject_id: int.parse(widget.quizesubjectid),
                    //         quiz_topics_id: widget.topicid,
                    //         subjectmodel: _controller.quizesubmitmodelques)
                    //     .then((value) => _controller.quizeshowanwser())
                    //     .then((value) => Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: ((context) => ExamScoreboardPage(
                    //                   name: widget.name,
                    //                   quizesubjectid: widget.quizesubjectid,
                    //                   topicid: widget.topicid,
                    //                   score: getscore(
                    //                           right_ans: _controller
                    //                               .quizetotalqurrect.length,
                    //                           wrong: questionlength -
                    //                               _controller
                    //                                   .quizetotalqurrect.length)
                    //                       .toString(),
                    //                   complete: complete(),
                    //                   correct: _controller
                    //                       .quizetotalqurrect.length
                    //                       .toString(),
                    //                   total: questionlength.toString(),
                    //                   wrong: (questionlength -
                    //                           _controller
                    //                               .quizetotalqurrect.length)
                    //                       .toString(),
                    //                 )))))
                    //     .then((value) {
                    //   Future.delayed(Duration(milliseconds: 500), () {
                    //     setState(() {
                    //       _controller.examtimechange(4);
                    //     });
                    //   });
                    // });
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                )
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
  final _controller = Get.put(Btncontroller());

  final audiplayer = AudioPlayer();

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
            onTap: _controller.quizesubmitmodelques
                    .any((element) => element.id == widget.data.id)
                ? null
                : () async {
                    await audiplayer.play(AssetSource("a.wav"));
                    _controller.quizeaddselectanwser(
                      value: widget.data.option1!,
                      id: widget.data.id,
                      rigthanw: widget.data.correctAns,
                      submitexammodel: SubmitmodelMcq(
                          id: widget.data.id,
                          option1: widget.data.option1,
                          option2: widget.data.option2,
                          option3: widget.data.option3,
                          option4: widget.data.option4,
                          question: widget.data.question,
                          rightAns: widget.data.correctAns,
                          submitAns: widget.data.option1),
                    );
                  },
            child: Card(
              color: _controller.quizesubmitmodelques.any((element) =>
                      element.id == widget.data.id &&
                      element.submitAns == widget.data.option1)
                  ? Colors.indigo
                  : Colors.white,
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Text("${widget.data.option1!}",
                    style: TextStyle(
                      color: _controller.quizesubmitmodelques.any((element) =>
                              element.id == widget.data.id &&
                              element.submitAns == widget.data.option1)
                          ? Colors.white
                          : Colors.black,
                    )),
              ),
            ),
          );
        }),
        Obx(() {
          return InkWell(
            onTap: _controller.quizesubmitmodelques
                    .any((element) => element.id == widget.data.id)
                ? null
                : () async {
                    await audiplayer.play(AssetSource("a.wav"));
                    _controller.quizeaddselectanwser(
                      value: widget.data.option2!,
                      id: widget.data.id,
                      rigthanw: widget.data.correctAns,
                      submitexammodel: SubmitmodelMcq(
                          id: widget.data.id,
                          option1: widget.data.option1,
                          option2: widget.data.option2,
                          option3: widget.data.option3,
                          option4: widget.data.option4,
                          question: widget.data.question,
                          rightAns: widget.data.correctAns,
                          submitAns: widget.data.option2),
                    );
                  },
            child: Card(
              color: _controller.quizesubmitmodelques.any((element) =>
                      element.id == widget.data.id &&
                      element.submitAns == widget.data.option2)
                  ? Colors.indigo
                  : Colors.white,
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Text("${widget.data.option2!}",
                    style: TextStyle(
                      color: _controller.quizesubmitmodelques.any((element) =>
                              element.id == widget.data.id &&
                              element.submitAns == widget.data.option2)
                          ? Colors.white
                          : Colors.black,
                    )),
              ),
            ),
          );
        }),
        Obx(() {
          return InkWell(
            onTap: _controller.quizesubmitmodelques
                    .any((element) => element.id == widget.data.id)
                ? null
                : () async {
                    await audiplayer.play(AssetSource("a.wav"));
                    _controller.quizeaddselectanwser(
                      value: widget.data.option3!,
                      id: widget.data.id,
                      rigthanw: widget.data.correctAns,
                      submitexammodel: SubmitmodelMcq(
                          id: widget.data.id,
                          option1: widget.data.option1,
                          option2: widget.data.option2,
                          option3: widget.data.option3,
                          option4: widget.data.option4,
                          question: widget.data.question,
                          rightAns: widget.data.correctAns,
                          submitAns: widget.data.option3),
                    );
                  },
            child: Card(
              color: _controller.quizesubmitmodelques.any((element) =>
                      element.id == widget.data.id &&
                      element.submitAns == widget.data.option3)
                  ? Colors.indigo
                  : Colors.white,
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Text("${widget.data.option3!}",
                    style: TextStyle(
                      color: _controller.quizesubmitmodelques.any((element) =>
                              element.id == widget.data.id &&
                              element.submitAns == widget.data.option3)
                          ? Colors.white
                          : Colors.black,
                    )),
              ),
            ),
          );
        }),
        Obx(() {
          return InkWell(
            onTap: _controller.quizesubmitmodelques
                    .any((element) => element.id == widget.data.id)
                ? null
                : () async {
                    await audiplayer.play(AssetSource("a.wav"));
                    _controller.quizeaddselectanwser(
                      value: widget.data.option4!,
                      id: widget.data.id,
                      rigthanw: widget.data.correctAns,
                      submitexammodel: SubmitmodelMcq(
                          id: widget.data.id,
                          option1: widget.data.option1,
                          option2: widget.data.option2,
                          option3: widget.data.option3,
                          option4: widget.data.option4,
                          question: widget.data.question,
                          rightAns: widget.data.correctAns,
                          submitAns: widget.data.option4),
                    );
                  },
            child: Card(
              color: _controller.quizesubmitmodelques.any((element) =>
                      element.id == widget.data.id &&
                      element.submitAns == widget.data.option4)
                  ? Colors.indigo
                  : Colors.white,
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "${widget.data.option4!}",
                  style: TextStyle(
                    color: _controller.quizesubmitmodelques.any((element) =>
                            element.id == widget.data.id &&
                            element.submitAns == widget.data.option4)
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
          );
        })
      ],
    );
  }
}
