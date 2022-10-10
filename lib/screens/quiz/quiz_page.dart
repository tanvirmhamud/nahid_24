// import 'package:audioplayers/audioplayers.dart';
// import 'package:clean_api/clean_api.dart';
// import 'package:get/get.dart';
// import 'package:nahid_24/application/app/quiz/quiz_provider.dart';
// import 'package:nahid_24/domain/app/model_test/model_test_ans_model.dart';
// import 'package:nahid_24/domain/app/model_test/model_test_info_model.dart';
// import 'package:nahid_24/domain/app/quiz/submit_quiz_info.dart';
// import 'package:nahid_24/domain/app/quiz/submit_quiz_model.dart';
// import 'package:nahid_24/screens/model%20test/model_test_correct_answers.dart';
// import 'package:nahid_24/screens/quiz/widgets/quiz_option.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:slide_countdown/slide_countdown.dart';

// import '../../getx/selectbtn.dart';

// class QuizPage extends HookConsumerWidget {
//   final int subjectId;
//   QuizPage({
//     Key? key,
//     required this.subjectId,
//   }) : super(key: key);
//   final _controller = Get.put(Btncontroller());

//   bool clear = true;

//   @override
//   Widget build(BuildContext context, ref) {
    
//     if (clear) {
//       _controller.clearall();
//       clear = false;
//     }
//     useEffect(() {
//       Future.delayed(const Duration(seconds: 1), () async {
//         ref.read(quizProvider(subjectId).notifier).getAllQuizList();
//       });
//       return null;
//     }, []);
//     final ValueNotifier<List<SubmitQuizInfo>> submitList =
//         useState(<SubmitQuizInfo>[]);
//     final activeIndex = useState(0);
//     final press = useState(0);
//     final selectedAns = useState('');
//     final quizList =
//         ref.watch(quizProvider(subjectId).select((value) => value.quizList));
//     // ref.listen(quizProvider(subjectId), <QuizState>(previous, next) {
//     //   if(next)
//     // });
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xf045de9).withOpacity(0.90),
//           elevation: 0,
//           title: SlideCountdownSeparated(
//             duration: const Duration(minutes: 20),
//           ),
//           actions: [],
//         ),
//         body: quizList.isEmpty
//             ? Center(
//                 child: CircularProgressIndicator(),
//               )
//             : SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       height: MediaQuery.of(context).size.height / 3,
//                       decoration: BoxDecoration(
//                         color: Color(0xf045de9).withOpacity(0.90),
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(20),
//                           bottomRight: Radius.circular(20),
//                         ),
//                       ),
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Container(
//                             width: double.infinity,
//                             height: 35,
//                             decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.white),
//                                 borderRadius: BorderRadius.circular(10)),
//                             child: Center(
//                               child: Text(
//                                 'Quiz',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w700,
//                                     color: Colors.white),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Transform.translate(
//                       offset: Offset(0, -80),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20),
//                         child: Card(
//                           elevation: 15,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20)),
//                           child: Container(
//                             width: double.infinity,
//                             height: 200,
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(20)),
//                             child: Transform.translate(
//                               offset: Offset(0, -30),
//                               child: Column(
//                                 children: [
//                                   CircleAvatar(
//                                     radius: 34,
//                                     child: CircleAvatar(
//                                       radius: 30,
//                                       backgroundColor: Colors.white,
//                                       child: Text(
//                                         // "10",
//                                         (activeIndex.value + 1).toString(),
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.w700,
//                                             fontSize: 24,
//                                             color: Colors.black),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 10),
//                                     child: Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             Text(
//                                               "01",
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.w700),
//                                             ),
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Container(
//                                               width: 20,
//                                               height: 5,
//                                               decoration: BoxDecoration(
//                                                   color: Colors.blue,
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           20)),
//                                             )
//                                           ],
//                                         ),
//                                         Row(
//                                           children: [
//                                             Container(
//                                               width: 20,
//                                               height: 5,
//                                               decoration: BoxDecoration(
//                                                   color: Colors.blue,
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           20)),
//                                             ),
//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Text(
//                                               "09",
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.w700),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   Column(
//                                     children: [
//                                       Text(
//                                         "Question ${activeIndex.value + 1}/${quizList.length}",
//                                         style: TextStyle(
//                                             color: Colors.blue,
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.w700),
//                                       ),
//                                       SizedBox(
//                                         height: 20,
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 15),
//                                         child: Text(
//                                           // "Adiba Bosri Bithi is excited about being.....grandmother",
//                                           quizList[activeIndex.value].question,
//                                           style: TextStyle(
//                                               color: Colors.black,
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.w500),
//                                         ),
//                                       )
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.symmetric(horizontal: 35),
//                       width: double.infinity,
//                       // height: MediaQuery.of(context).size.height / 2.8,
//                       color: Colors.white,
//                       child: Column(
//                         children: [
//                           InkWell(
//                             onTap: () async {
//                               final audiplayer = AudioPlayer();
//                               await audiplayer.play(AssetSource("a.wav"));
//                               press.value = 1;
//                             },
//                             child: QuizOption(
//                               isCorrect: press.value == 1 ? some(true) : none(),
//                               optionText: quizList[activeIndex.value].option1,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           InkWell(
//                             onTap: () async {
//                               final audiplayer = AudioPlayer();
//                               await audiplayer.play(AssetSource("a.wav"));
//                               press.value = 2;
//                             },
//                             child: QuizOption(
//                               isCorrect: press.value == 2 ? some(true) : none(),
//                               optionText: quizList[activeIndex.value].option2,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           InkWell(
//                             onTap: () async {
//                               final audiplayer = AudioPlayer();
//                               await audiplayer.play(AssetSource("a.wav"));
//                               press.value = 3;
//                             },
//                             child: QuizOption(
//                               isCorrect: press.value == 3 ? some(true) : none(),
//                               optionText: quizList[activeIndex.value].option3,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           InkWell(
//                             onTap: () async {
//                               final audiplayer = AudioPlayer();
//                               await audiplayer.play(AssetSource("a.wav"));
//                               press.value = 4;
//                             },
//                             child: QuizOption(
//                               isCorrect: press.value == 4 ? some(true) : none(),
//                               optionText: quizList[activeIndex.value].option4,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               // SizedBox(
//                               //   width: 40,
//                               //   height: 40,
//                               //   child: ElevatedButton(
//                               //     onPressed: () {
//                               //       if (activeIndex.value != 0)
//                               //         activeIndex.value = activeIndex.value - 1;
//                               //     },
//                               //     child: Icon(Icons.arrow_back_ios),
//                               //     style: ElevatedButton.styleFrom(
//                               //       shape: RoundedRectangleBorder(
//                               //         borderRadius: BorderRadius.circular(40),
//                               //       ),
//                               //     ),
//                               //   ),
//                               // ),
//                               SizedBox(
//                                 width: 40,
//                                 height: 40,
//                                 child: ElevatedButton(
//                                   onPressed: () {
//                                     if (press.value == 1) {
//                                       selectedAns.value =
//                                           quizList[activeIndex.value].option1;
//                                     }
//                                     if (press.value == 2) {
//                                       selectedAns.value =
//                                           quizList[activeIndex.value].option2;
//                                     }
//                                     if (press.value == 3) {
//                                       selectedAns.value =
//                                           quizList[activeIndex.value].option3;
//                                     }
//                                     if (press.value == 4) {
//                                       selectedAns.value =
//                                           quizList[activeIndex.value].option4;
//                                     }
//                                     submitList.value.add(
//                                       SubmitQuizInfo(
//                                           id: quizList[activeIndex.value].id,
//                                           question: quizList[activeIndex.value]
//                                               .question,
//                                           option1: quizList[activeIndex.value]
//                                               .option1,
//                                           option2: quizList[activeIndex.value]
//                                               .option2,
//                                           option3: quizList[activeIndex.value]
//                                               .option3,
//                                           option4: quizList[activeIndex.value]
//                                               .option4,
//                                           right_ans: quizList[activeIndex.value]
//                                               .correctAns,
//                                           submit_ans: selectedAns.value),
//                                     );
//                                     if (activeIndex.value !=
//                                         quizList.length - 1) {
//                                       activeIndex.value = activeIndex.value + 1;
//                                       press.value = 0;
//                                       Logger.i(submitList.value);
//                                     } else {
//                                       final submitQuizModel = SubmitQuizModel(
//                                         quiz_topics_id: int.parse(
//                                             quizList[activeIndex.value]
//                                                 .quizTopicsId),
//                                         quiz_subject_id: int.parse(
//                                             quizList[activeIndex.value]
//                                                 .quizSubjectId),
//                                         exam_info: submitList.value,
//                                       );
//                                       Logger.i(submitQuizModel);
//                                       ref
//                                           .read(
//                                               quizProvider(subjectId).notifier)
//                                           .submitQuiz(submitQuizModel);
//                                       Navigator.of(context).pop();
//                                       Navigator.of(context).push(
//                                         MaterialPageRoute(
//                                           builder: (context) => ModelTestCorrectAnswers(
//                                               modelTestInfoModel: ModelTestAnsModel(
//                                                   exam_info: submitList.value
//                                                       .map((e) =>
//                                                           ModelTestInfoModel(
//                                                               id: e.id,
//                                                               question:
//                                                                   e.question,
//                                                               option1:
//                                                                   e.option1,
//                                                               option2:
//                                                                   e.option2,
//                                                               option3:
//                                                                   e.option3,
//                                                               option4:
//                                                                   e.option4,
//                                                               right_ans:
//                                                                   e.right_ans,
//                                                               submit_ans:
//                                                                   e.submit_ans))
//                                                       .toList(),
//                                                   test_subject_id: 0,
//                                                   test_topic_id: 0,
//                                                   title_id: 0)),
//                                         ),
//                                       );
//                                     }
//                                   },
//                                   child: Transform.translate(
//                                     offset: Offset(-8, 0),
//                                     child:
//                                         activeIndex.value + 1 == quizList.length
//                                             ? Icon(Icons.send)
//                                             : Icon(Icons.arrow_forward_ios),
//                                   ),
//                                   style: ElevatedButton.styleFrom(
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(40),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 30,
//                     )
//                   ],
//                 ),
//               ),
//       ),
//     );
//   }
// }
