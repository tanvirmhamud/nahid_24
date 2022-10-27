import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nahid_24/Model/quize2submit.dart';
import 'package:nahid_24/New_Design/quiz/scorebord.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../../Http/Quize2/quize2.dart';
import '../../Model/quize2list.dart';
import '../../New_Design/Scorebord/scorebord.dart';
import '../../getx/selectbtn.dart';

class Quize2page extends StatefulWidget {
  final int subjectid;
  final int topicid;
  final String name;

  const Quize2page(
      {Key? key,
      required this.subjectid,
      required this.topicid,
      required this.name})
      : super(key: key);

  @override
  State<Quize2page> createState() => _Quize2pageState();
}

class _Quize2pageState extends State<Quize2page> {
  final _controller = Get.put(Btncontroller());

  PageController pageController = PageController();

  int pageindex = 0;

  double getscore({int? right_ans, int? wrong}) {
    double score = ((right_ans! * 1) - wrong! * 0.25).toDouble();

    return score;
  }

  int totalquestion = 0;

  String complete() {
    var completequestion = _controller.quize2rigthanwser.value +
        _controller.quize2wronganwser.value;
    return ((completequestion / totalquestion) * 100).toString();
  }

  @override
  void initState() {
    _controller.clearall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        actions: [
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Obx(() {
          //       return Text(
          //           "Rigth anwser: ${_controller.quize2rigthanwser.value}  ");
          //     }),
          //     Obx(() {
          //       return Text(
          //           "Wrong anwser: ${_controller.quize2wronganwser.value}  ");
          //     }),

          //     Text(
          //         "Score: ${getscore(right_ans: _controller.quize2rigthanwser.value, wrong: _controller.quize2wronganwser.value)}")
          //     // Obx(() {
          //     // Text("Wrong anwser: ${_controller.quize2wronganwser}"),

          //     // Obx(() {
          //     //   return Text("Score: ${0}");
          //     // }),
          //   ],
          // ),
        ],
      ),
      body: FutureBuilder<Quize2List?>(
        future: HttpQuize2().getquize2list(widget.topicid),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: pageController,
                itemCount: snapshot.data!.data!.length,
                onPageChanged: (value) {
                  setState(() {
                    pageindex = value;
                  });
                },
                itemBuilder: ((context, index) {
                  totalquestion = snapshot.data!.data!.length;
                  var data = snapshot.data!.data![index];
                  return Container(
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 4,
                          decoration: BoxDecoration(
                            color: Color(0xf045de9).withOpacity(0.90),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              SizedBox(height: 10),
                              Container(
                                width: double.infinity,
                                height: 35,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    'Quiz',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 120,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Column(
                            children: [
                              Transform.translate(
                                offset: Offset(0, 0),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Card(
                                    elevation: 15,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Container(
                                      width: double.infinity,
                                      height: 200,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Transform.translate(
                                        offset: Offset(0, -30),
                                        child: Column(
                                          children: [
                                            Obx(() {
                                              if (_controller.quizetime.value ==
                                                  15) {
                                                return CircleAvatar(
                                                  radius: 34,
                                                  child: CircleAvatar(
                                                    radius: 30,
                                                    backgroundColor:
                                                        Colors.white,
                                                    child:
                                                        SlideCountdownSeparated(
                                                      decoration: BoxDecoration(
                                                          color: Colors.white),
                                                      textStyle: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      duration:
                                                          Duration(seconds: _controller
                                                              .quizetime.value),
                                                      onDone: () {
                                                        pageController.nextPage(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    500),
                                                            curve:
                                                                Curves.easeIn);
                                                        // HttpModel()
                                                        //     .submitmodeltest(
                                                        //         test_subject_id:
                                                        //             int.parse(widget.testsubjectid),
                                                        //         test_topic_id: widget.topicid,
                                                        //         titleid: int.parse(widget.titleid),
                                                        //         subjectmodel:
                                                        //             _controller.submitmodelques)
                                                        //     .then(
                                                        //         (value) => _controller.showanwser());
                                                      },
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                return CircleAvatar(
                                                  radius: 34,
                                                  child: CircleAvatar(
                                                    radius: 30,
                                                    backgroundColor:
                                                        Colors.white,
                                                  ),
                                                );
                                              }
                                            }),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "01",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        width: 20,
                                                        height: 5,
                                                        decoration: BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width: 20,
                                                        height: 5,
                                                        decoration: BoxDecoration(
                                                            color: Colors.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        "09",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Question ${index + 1}/${snapshot.data!.data!.length}",
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15),
                                                  child: Text(
                                                    // "Adiba Bosri Bithi is excited about being.....grandmother",
                                                    data.question!,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Singlequestion(data: data),
                              snapshot.data!.data!.length == pageindex + 1
                                  ? MaterialButton(
                                      color: Colors.indigo,
                                      onPressed: () {
                                        HttpQuize2()
                                            .submitquize2(
                                                quiz_subject_id: snapshot.data!
                                                    .data!.first.quizSubjectId,
                                                quiz_topics_id: snapshot.data!
                                                    .data!.first.quizTopicsId,
                                                quize2data: _controller
                                                    .quize2submitdata)
                                            .then((value) => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: ((context) =>
                                                        QuizeScoreboardPage(
                                                          topicid:
                                                              widget.topicid,
                                                          subjectid:
                                                              widget.subjectid,
                                                          score: getscore(
                                                                  right_ans:
                                                                      _controller
                                                                          .quize2rigthanwser
                                                                          .value,
                                                                  wrong: _controller
                                                                      .quize2wronganwser
                                                                      .value)
                                                              .toString(),
                                                          complete: complete(),
                                                          correct: _controller
                                                              .quize2rigthanwser
                                                              .value,
                                                          total: totalquestion
                                                              .toString(),
                                                          wrong: _controller
                                                              .quize2wronganwser
                                                              .value,
                                                        )))))
                                            .then((value) {
                                          Future.delayed(
                                              Duration(milliseconds: 500), () {
                                            setState(() {
                                              _controller.quizetimechange(15);
                                            });
                                          });
                                          setState(() {
                                            pageController.jumpToPage(0);
                                            pageindex = 0;
                                          });
                                        });
                                      },
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  : MaterialButton(
                                      color: Colors.indigo,
                                      onPressed: () {
                                        pageController.nextPage(
                                            duration:
                                                Duration(milliseconds: 800),
                                            curve: Curves.easeIn);
                                      },
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      ),
                                    )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}

class Singlequestion extends StatefulWidget {
  final Datum data;
  const Singlequestion({Key? key, required this.data}) : super(key: key);

  @override
  State<Singlequestion> createState() => _SinglequestionState();
}

class _SinglequestionState extends State<Singlequestion> {
  final _controller = Get.put(Btncontroller());

  String selectanwser1 = "";
  String selectanwser2 = "";
  String selectanwser3 = "";
  String selectanwser4 = "";

  Color identifyanser(question) {
    if (_controller.quize2submitdata
        .any((element) => element.id == widget.data.id)) {
      if (question == widget.data.correctAns) {
        return Colors.green;
      } else if (_controller.quize2submitdata.any((element) =>
          element.id == widget.data.id && element.submitAns != question)) {
        return Colors.indigo;
      } else {
        return Colors.red;
      }
    } else {
      return Colors.indigo;
    }
  }

  // _controller.quize2submitdata.contains(Quize2Data(
  //                 id: widget.data.id,
  //                 option1: widget.data.option1,
  //                 option2: widget.data.option2,
  //                 option3: widget.data.option3,
  //                 option4: widget.data.option4,
  //                 question: widget.data.question,
  //                 rightAns: widget.data.correctAns,
  //                 submitAns: widget.data.option1)

  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: _controller.quize2submitdata
                  .any((element) => element.id == widget.data.id)
              ? null
              : () async {
                  print("tanvir1");
                  selectanwser1 = widget.data.option1!;
                  var quize2data = Quize2Data(
                      id: widget.data.id,
                      option1: widget.data.option1,
                      option2: widget.data.option2,
                      option3: widget.data.option3,
                      option4: widget.data.option4,
                      question: widget.data.question,
                      rightAns: widget.data.correctAns,
                      submitAns: widget.data.option1);
                  _controller.addquize2data(quize2data);

                  setState(() {
                    selected = true;
                  });

                  final audiplayer = AudioPlayer();
                  if (selectanwser1 == widget.data.correctAns) {
                    await audiplayer.play(AssetSource("a.wav"));
                  } else {
                    await audiplayer.play(AssetSource("Wrong.wav"));
                  }
                },
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: identifyanser(widget.data.option1)),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.data.option1!,
                    style: TextStyle(fontSize: 18),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: identifyanser(widget.data.option1) == Colors.green
                          ? Icon(Icons.check_circle,
                              size: 30.0, color: Colors.green)
                          : identifyanser(widget.data.option1) == Colors.red
                              ? Icon(
                                  Icons.close,
                                  size: 30.0,
                                  color: Colors.red,
                                )
                              : Container()

                      // child: Icon(
                      //   selected
                      //       ? widget.data.option1 == widget.data.correctAns
                      //           ? Icons.check_circle
                      //           : selectanwser1 != ""
                      //               ? Icons.close
                      //               : Icons.check_circle
                      //       : Icons.check_circle,
                      //   size: 30.0,
                      //   color: selected
                      //       ? widget.data.option1 == widget.data.correctAns
                      //           ? Colors.green
                      //           : selectanwser1 != ""
                      //               ? Colors.red
                      //               : Colors.indigo
                      //       : Colors.indigo,
                      // ),
                      ),
                ]),
          ),
        ),
        InkWell(
          onTap: _controller.quize2submitdata
                  .any((element) => element.id == widget.data.id)
              ? null
              : () async {
                  selectanwser2 = widget.data.option2!;
                  var quize2data = Quize2Data(
                      id: widget.data.id,
                      option1: widget.data.option1,
                      option2: widget.data.option2,
                      option3: widget.data.option3,
                      option4: widget.data.option4,
                      question: widget.data.question,
                      rightAns: widget.data.correctAns,
                      submitAns: widget.data.option2);
                  _controller.addquize2data(quize2data);
                  final audiplayer = AudioPlayer();
                  if (selectanwser2 == widget.data.correctAns) {
                    await audiplayer.play(AssetSource("a.wav"));
                  } else {
                    await audiplayer.play(AssetSource("Wrong.wav"));
                  }
                  setState(() {
                    selected = true;
                  });
                },
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: identifyanser(widget.data.option2)),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.data.option2!,
                    style: TextStyle(fontSize: 18),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: identifyanser(widget.data.option2) == Colors.green
                          ? Icon(Icons.check_circle,
                              size: 30.0, color: Colors.green)
                          : identifyanser(widget.data.option2) == Colors.red
                              ? Icon(
                                  Icons.close,
                                  size: 30.0,
                                  color: Colors.red,
                                )
                              : Container()

                      // child: Icon(
                      //   selected
                      //       ? widget.data.option1 == widget.data.correctAns
                      //           ? Icons.check_circle
                      //           : selectanwser1 != ""
                      //               ? Icons.close
                      //               : Icons.check_circle
                      //       : Icons.check_circle,
                      //   size: 30.0,
                      //   color: selected
                      //       ? widget.data.option1 == widget.data.correctAns
                      //           ? Colors.green
                      //           : selectanwser1 != ""
                      //               ? Colors.red
                      //               : Colors.indigo
                      //       : Colors.indigo,
                      // ),
                      ),
                ]),
          ),
        ),
        InkWell(
          onTap: _controller.quize2submitdata
                  .any((element) => element.id == widget.data.id)
              ? null
              : () async {
                  print("tanvir1");
                  selectanwser3 = widget.data.option3!;
                  var quize2data = Quize2Data(
                      id: widget.data.id,
                      option1: widget.data.option1,
                      option2: widget.data.option2,
                      option3: widget.data.option3,
                      option4: widget.data.option4,
                      question: widget.data.question,
                      rightAns: widget.data.correctAns,
                      submitAns: widget.data.option3);
                  _controller.addquize2data(quize2data);
                  final audiplayer = AudioPlayer();
                  if (selectanwser3 == widget.data.correctAns) {
                    await audiplayer.play(AssetSource("a.wav"));
                  } else {
                    await audiplayer.play(AssetSource("Wrong.wav"));
                  }
                  setState(() {
                    selected = true;
                  });
                },
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: identifyanser(widget.data.option3)),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.data.option3!,
                    style: TextStyle(fontSize: 18),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: identifyanser(widget.data.option3) == Colors.green
                          ? Icon(Icons.check_circle,
                              size: 30.0, color: Colors.green)
                          : identifyanser(widget.data.option3) == Colors.red
                              ? Icon(
                                  Icons.close,
                                  size: 30.0,
                                  color: Colors.red,
                                )
                              : Container()

                      // child: Icon(
                      //   selected
                      //       ? widget.data.option1 == widget.data.correctAns
                      //           ? Icons.check_circle
                      //           : selectanwser1 != ""
                      //               ? Icons.close
                      //               : Icons.check_circle
                      //       : Icons.check_circle,
                      //   size: 30.0,
                      //   color: selected
                      //       ? widget.data.option1 == widget.data.correctAns
                      //           ? Colors.green
                      //           : selectanwser1 != ""
                      //               ? Colors.red
                      //               : Colors.indigo
                      //       : Colors.indigo,
                      // ),
                      ),
                ]),
          ),
        ),
        InkWell(
          onTap: _controller.quize2submitdata
                  .any((element) => element.id == widget.data.id)
              ? null
              : () async {
                  print("tanvir1");
                  selectanwser4 = widget.data.option4!;
                  var quize2data = Quize2Data(
                      id: widget.data.id,
                      option1: widget.data.option1,
                      option2: widget.data.option2,
                      option3: widget.data.option3,
                      option4: widget.data.option4,
                      question: widget.data.question,
                      rightAns: widget.data.correctAns,
                      submitAns: widget.data.option4);
                  _controller.addquize2data(quize2data);
                  final audiplayer = AudioPlayer();
                  if (selectanwser4 == widget.data.correctAns) {
                    await audiplayer.play(AssetSource("a.wav"));
                  } else {
                    await audiplayer.play(AssetSource("Wrong.wav"));
                  }
                  setState(() {
                    selected = true;
                  });
                },
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: identifyanser(widget.data.option4)),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.data.option4!,
                    style: TextStyle(fontSize: 18),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: identifyanser(widget.data.option4) == Colors.green
                          ? Icon(Icons.check_circle,
                              size: 30.0, color: Colors.green)
                          : identifyanser(widget.data.option4) == Colors.red
                              ? Icon(
                                  Icons.close,
                                  size: 30.0,
                                  color: Colors.red,
                                )
                              : Container()

                      // child: Icon(
                      //   selected
                      //       ? widget.data.option1 == widget.data.correctAns
                      //           ? Icons.check_circle
                      //           : selectanwser1 != ""
                      //               ? Icons.close
                      //               : Icons.check_circle
                      //       : Icons.check_circle,
                      //   size: 30.0,
                      //   color: selected
                      //       ? widget.data.option1 == widget.data.correctAns
                      //           ? Colors.green
                      //           : selectanwser1 != ""
                      //               ? Colors.red
                      //               : Colors.indigo
                      //       : Colors.indigo,
                      // ),
                      ),
                ]),
          ),
        ),
      ],
    );
  }
}
