import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nahid_24/Model/quize2submit.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../../../Http/Quize2/quize2.dart';
import '../../../Model/quize2list.dart';
import '../../../getx/selectbtn.dart';

class ReviewQuize2page extends StatefulWidget {
  final int subjectid;
  final int topicid;

  const ReviewQuize2page(
      {Key? key, required this.subjectid, required this.topicid})
      : super(key: key);

  @override
  State<ReviewQuize2page> createState() => _ReviewQuize2pageState();
}

class _ReviewQuize2pageState extends State<ReviewQuize2page> {
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: SingleChildScrollView(
        child: FutureBuilder<Quize2List?>(
          future: HttpQuize2().getquize2list(widget.topicid),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: ((context, index) {
                        totalquestion = snapshot.data!.data!.length;
                        var data = snapshot.data!.data![index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 10),
                              child: Text(
                                "${data.question}",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Singlequestion(data: data),
                          ],
                        );
                      })),
                ],
              );
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
                              : widget.data.option1 == widget.data.correctAns
                                  ? Icon(Icons.check_circle,
                                      size: 30.0, color: Colors.green)
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
                              : widget.data.option2 == widget.data.correctAns
                                  ? Icon(Icons.check_circle,
                                      size: 30.0, color: Colors.green)
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
                              : widget.data.option3 == widget.data.correctAns
                                  ? Icon(Icons.check_circle,
                                      size: 30.0, color: Colors.green)
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
                              : widget.data.option4 == widget.data.correctAns
                                  ? Icon(Icons.check_circle,
                                      size: 30.0, color: Colors.green)
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
