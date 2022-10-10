// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:nahid_24/application/app/model_test/model_test_provider.dart';
// import 'package:nahid_24/domain/app/model_test/model_test_ans_model.dart';
// import 'package:nahid_24/domain/app/model_test/model_test_info_model.dart';
// import 'package:nahid_24/screens/model%20test/widgets/model_test_body.dart';

// class ModelTestPage extends StatefulWidget {
//   final int subjectId;
//   final int titleId;
//   final int topicId;
//   const ModelTestPage(
//       {Key? key,
//       required this.subjectId,
//       required this.titleId,
//       required this.topicId})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context, ref) {
//     useEffect(() {
//       Future.delayed(const Duration(seconds: 1), () async {
//         ref.read(modelTestProvider(topicId).notifier).getAllModelTestMcqs();
//       });
//       return null;
//     }, []);

//     final quesList = ref.watch(modelTestProvider(topicId).select((value) =>
//         value.modelMcqs
//             .map((e) => ModelTestInfoModel(
//                 id: e.id,
//                 question: e.question,
//                 option1: e.option1,
//                 option2: e.option2,
//                 option3: e.option3,
//                 option4: e.option4,
//                 right_ans: e.correct_ans,
//                 submit_ans: ''))
//             .toList()));

//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xf045de9).withOpacity(0.90),
//           elevation: 0,
//         ),
//         body: quesList.isEmpty
//             ? Center(
//                 child: CircularProgressIndicator(),
//               )
//             : SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: Color(0xf045de9).withOpacity(0.90),
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(20),
//                           bottomRight: Radius.circular(20),
//                         ),
//                       ),
//                       child: Column(
//                         children: [
//                           Container(
//                             padding: EdgeInsets.all(10),
//                             margin: EdgeInsets.symmetric(horizontal: 20),
//                             decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.white),
//                                 borderRadius: BorderRadius.circular(10)),
//                             child: Center(
//                               child: Text(
//                                 'Model Test',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w700,
//                                     color: Colors.white),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 50,
//                     ),
//                     ModelTestBody(
//                         modelTestAnsModel: ModelTestAnsModel(
//                             title_id: titleId,
//                             test_subject_id: subjectId,
//                             test_topic_id: topicId,
//                             exam_info: quesList)),
//                     SizedBox(
//                       height: 30,
//                     )
//                   ],
//                 ),
//               ),
//         // bottomNavigationBar: Padding(
//         //   padding: EdgeInsets.only(bottom: 10, left: 70, right: 70),
//         //   child: ElevatedButton(
//         //     onPressed: () {
//         //       final ans = ref
//         //           .watch(modelTestAnswerProvider(ModelTestAnsModel.init()))
//         //           .answers;
//         //       ref
//         //           .read(modelTestAnswerProvider(ModelTestAnsModel.init())
//         //               .notifier)
//         //           .submitModelTestAnswer();
//         //       Navigator.of(context).pop();
//         //     },
//         //     child: Transform.translate(
//         //       offset: Offset(-8, 0),
//         //       child: Text('Submit'),
//         //     ),
//         //     style: ElevatedButton.styleFrom(),
//         //   ),
//         // ),
//       ),
//     );
//   }
  

// }


// // class ModelTestPage extends StatefulWidget {
// //   final int subjectId;
// //   final int titleId;
// //   final int topicId;
// //   const ModelTestPage(
// //       {Key? key,
// //       required this.topicId,
// //       required this.subjectId,
// //       required this.titleId})
// //       : super(key: key);

// //   @override
// //   Widget build(BuildContext context, ref) {
// //     useEffect(() {
// //       Future.delayed(const Duration(seconds: 1), () async {
// //         ref.read(modelTestProvider(topicId).notifier).getAllModelTestMcqs();
// //       });
// //       return null;
// //     }, []);

// //     print("tanvir    $topicId");

// //     final quesList = ref.watch(modelTestProvider(topicId).select((value) =>
// //         value.modelMcqs
// //             .map((e) => ModelTestInfoModel(
// //                 id: e.id,
// //                 question: e.question,
// //                 option1: e.option1,
// //                 option2: e.option2,
// //                 option3: e.option3,
// //                 option4: e.option4,
// //                 right_ans: e.correct_ans,
// //                 submit_ans: ''))
// //             .toList()));

// //     return SafeArea(
// //       child: Scaffold(
// //         appBar: AppBar(
// //           backgroundColor: Color(0xf045de9).withOpacity(0.90),
// //           elevation: 0,
// //         ),
// //         body: quesList.isEmpty
// //             ? Center(
// //                 child: CircularProgressIndicator(),
// //               )
// //             : SingleChildScrollView(
// //                 child: Column(
// //                   children: [
// //                     Container(
// //                       width: double.infinity,
// //                       decoration: BoxDecoration(
// //                         color: Color(0xf045de9).withOpacity(0.90),
// //                         borderRadius: BorderRadius.only(
// //                           bottomLeft: Radius.circular(20),
// //                           bottomRight: Radius.circular(20),
// //                         ),
// //                       ),
// //                       child: Column(
// //                         children: [
// //                           Container(
// //                             padding: EdgeInsets.all(10),
// //                             margin: EdgeInsets.symmetric(horizontal: 20),
// //                             decoration: BoxDecoration(
// //                                 border: Border.all(color: Colors.white),
// //                                 borderRadius: BorderRadius.circular(10)),
// //                             child: Center(
// //                               child: Text(
// //                                 'Model Test',
// //                                 style: TextStyle(
// //                                     fontSize: 20,
// //                                     fontWeight: FontWeight.w700,
// //                                     color: Colors.white),
// //                               ),
// //                             ),
// //                           ),
// //                           SizedBox(
// //                             height: 20,
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     SizedBox(
// //                       height: 50,
// //                     ),
// //                     ModelTestBody(
// //                         modelTestAnsModel: ModelTestAnsModel(
// //                             title_id: titleId,
// //                             test_subject_id: subjectId,
// //                             test_topic_id: topicId,
// //                             exam_info: quesList)),
// //                     SizedBox(
// //                       height: 30,
// //                     )
// //                   ],
// //                 ),
// //               ),
// //         // bottomNavigationBar: Padding(
// //         //   padding: EdgeInsets.only(bottom: 10, left: 70, right: 70),
// //         //   child: ElevatedButton(
// //         //     onPressed: () {
// //         //       final ans = ref
// //         //           .watch(modelTestAnswerProvider(ModelTestAnsModel.init()))
// //         //           .answers;
// //         //       ref
// //         //           .read(modelTestAnswerProvider(ModelTestAnsModel.init())
// //         //               .notifier)
// //         //           .submitModelTestAnswer();
// //         //       Navigator.of(context).pop();
// //         //     },
// //         //     child: Transform.translate(
// //         //       offset: Offset(-8, 0),
// //         //       child: Text('Submit'),
// //         //     ),
// //         //     style: ElevatedButton.styleFrom(),
// //         //   ),
// //         // ),
// //       ),
// //     );
// //   }
  

// // }
