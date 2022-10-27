// import 'package:clean_api/clean_api.dart';
// import 'package:flutter/material.dart';
// import 'package:nahid_24/domain/app/model_test/model_test_info_model.dart';
// import 'package:nahid_24/screens/quiz/widgets/quiz_option.dart';

// class AnswerCard extends StatelessWidget {
//   const AnswerCard(
//       {Key? key,
//       this.showWrong = false,
//       required this.index,
//       required this.question,
//       required this.length,
//       required this.answer})
//       : super(key: key);
//   final bool showWrong;
//   final ModelTestInfoModel question;
//   final int index;
//   final int length;
//   final void Function(String) answer;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20),
//       child: Card(
//         elevation: 15,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         child: Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//               color: Colors.white, borderRadius: BorderRadius.circular(20)),
//           child: Transform.translate(
//             offset: Offset(0, -30),
//             child: Column(
//               children: [
//                 CircleAvatar(
//                   radius: 34,
//                   child: CircleAvatar(
//                     radius: 30,
//                     backgroundColor: Colors.white,
//                     child: Text(
//                       (index + 1).toString(),
//                       style: TextStyle(
//                           fontWeight: FontWeight.w700,
//                           fontSize: 24,
//                           color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             "01",
//                             style: TextStyle(fontWeight: FontWeight.w700),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Container(
//                             width: 20,
//                             height: 5,
//                             decoration: BoxDecoration(
//                                 color: Colors.blue,
//                                 borderRadius: BorderRadius.circular(20)),
//                           )
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Container(
//                             width: 20,
//                             height: 5,
//                             decoration: BoxDecoration(
//                                 color: Colors.blue,
//                                 borderRadius: BorderRadius.circular(20)),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Text(
//                             "09",
//                             style: TextStyle(fontWeight: FontWeight.w700),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Column(
//                   children: [
//                     Text(
//                       "Question ${index + 1}/${length}",
//                       // 'ques',
//                       style: TextStyle(
//                           color: Colors.blue,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w700),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15),
//                       child: Text(
//                         question.question,
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       margin: EdgeInsets.symmetric(horizontal: 35),
//                       width: double.infinity,
//                       color: Colors.white,
//                       child: Column(
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               answer(question.option1);
//                             },
//                             child: QuizOption(
//                               isCorrect: showWrong
//                                   ? (question.submit_ans == question.option1 ||
//                                           question.right_ans == question.option1
//                                       ? some(question.right_ans ==
//                                               question.option1 ||
//                                           question.submit_ans ==
//                                               question.right_ans)
//                                       : none())
//                                   : question.submit_ans == question.option1
//                                       ? some(true)
//                                       : none(),
//                               optionText: question.option1,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           InkWell(
//                             onTap: () {
//                               answer(question.option2);
//                             },
//                             child: QuizOption(
//                               isCorrect: showWrong
//                                   ? (question.submit_ans == question.option2 ||
//                                           question.right_ans == question.option2
//                                       ? some(question.right_ans ==
//                                               question.option2 ||
//                                           question.submit_ans ==
//                                               question.right_ans)
//                                       : none())
//                                   : question.submit_ans == question.option2
//                                       ? some(true)
//                                       : none(),
//                               optionText: question.option2,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           InkWell(
//                             onTap: () {
//                               answer(question.option3);
//                             },
//                             child: QuizOption(
//                               isCorrect: showWrong
//                                   ? (question.submit_ans == question.option3 ||
//                                           question.right_ans == question.option3
//                                       ? some(question.right_ans ==
//                                               question.option3 ||
//                                           question.submit_ans ==
//                                               question.right_ans)
//                                       : none())
//                                   : question.submit_ans == question.option3
//                                       ? some(true)
//                                       : none(),
//                               optionText: question.option3,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           InkWell(
//                             onTap: () {
//                               answer(question.option4);
//                             },
//                             child: QuizOption(
//                               isCorrect: showWrong
//                                   ? (question.submit_ans == question.option4 ||
//                                           question.right_ans == question.option4
//                                       ? some(question.right_ans ==
//                                               question.option4 ||
//                                           question.submit_ans ==
//                                               question.right_ans)
//                                       : none())
//                                   : question.submit_ans == question.option4
//                                       ? some(true)
//                                       : none(),
//                               optionText: question.option4,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
