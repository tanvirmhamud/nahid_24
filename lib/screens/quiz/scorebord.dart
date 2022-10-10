import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getx/selectbtn.dart';
import '../../utils/function/navigation.dart';
import 'Review_Quize/reviewquize.dart';
import 'lavelboard.dart';

class QuizeScoreboardPage extends StatefulWidget {
  final String complete;
  final String total;
  final int correct;
  final int wrong;
  final String score;
  final int subjectid;
  final int topicid;
  const QuizeScoreboardPage(
      {Key? key,
      required this.complete,
      required this.total,
      required this.correct,
      required this.wrong,
      required this.score,
      required this.subjectid,
      required this.topicid})
      : super(key: key);

  @override
  State<QuizeScoreboardPage> createState() => _QuizeScoreboardPageState();
}

class _QuizeScoreboardPageState extends State<QuizeScoreboardPage> {
  final _controller = Get.put(Btncontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.5),
                    radius: 80,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundColor: Colors.indigo,
                    radius: 60,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    child: Text(
                      "Your Score \n${widget.score}/${widget.total * 1}",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                )
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(0, -70),
            child: Container(
              height: 150,
              margin: EdgeInsets.all(10),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.indigo,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${widget.total}",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Total Question",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.green,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${widget.correct} x 1 = ${widget.correct * 1}",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Correct Anwser",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.red,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${widget.wrong}",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Wrong Anwser",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.red,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${widget.wrong} X ${0.25} = ${widget.wrong * 0.25}",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Negative Mark",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                              ],
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
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            InkWell(
              onTap: () {
                _controller.clearall();
                _controller.quizetimechange(0);
                Navigator.pop(context);
              },
              child: Column(
                children: [
                  CircleAvatar(
              backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/quiz-button-1.png"),
                  ),
                  Text("Model Again")
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => ReviewQuize2page(
                              topicid: widget.topicid,
                              subjectid: widget.subjectid,
                            ))));
              },
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/quiz-button-2.png"),
                  ),
                  Text("Review Anwser")
                ],
              ),
            ),
            InkWell(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/quiz-button-3.png"),
                  ),
                  Text("Share Score")
                ],
              ),
            )
            //   InkWell(
            //     onTap: () {
            //       Navigator.pop(context);
            //     },
            //     child: Column(
            //       children: [
            //         CircleAvatar(
            //           backgroundColor: Colors.white,
            //           radius: 25,
            //           child: Icon(Icons.home),
            //         ),
            //         Text("Return Home")
            //       ],
            //     ),
            //   ),
            //   InkWell(
            //     onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => ExamLavelBoardPage()));
            //     },
            //     child: Column(
            //       children: [
            //         CircleAvatar(
            //           backgroundColor: Colors.white,
            //           backgroundImage: AssetImage("assets/review.png"),
            //           radius: 25,
            //           child: Icon(Icons.home),
            //         ),
            //         Text("Scorebord")
            //       ],
            //     ),
            //   ),
            // ],
          ]),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => QuizeLavelBoardPage(
                                quiz_subject_id: widget.subjectid.toString(),
                                quiz_topics_id: widget.topicid.toString(),
                              ))));
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/quiz-button-4.png"),
                    ),
                    Text("Leaderboard")
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              NavigationScreen(selectedIndex: 0))),
                      (route) => false);
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/quiz-button-5.png"),
                    ),
                    Text("Home")
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
