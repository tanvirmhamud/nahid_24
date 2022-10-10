// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:get/get.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:nahid_24/application/app/model_test/model_test_ans_provider.dart';
// import 'package:nahid_24/domain/app/model_test/model_test_ans_model.dart';
// import 'package:nahid_24/screens/model%20test/model_test_correct_answers.dart';

// import '../../../domain/app/model_test/model_test_info_model.dart';
// import '../../../getx/selectbtn.dart';
// import 'answer_card.dart';

// class AnswerList extends HookConsumerWidget {
//   final ModelTestAnsModel modelTestAnsModel;
//   final bool showWrong;

//   AnswerList(
//       {Key? key, required this.modelTestAnsModel, this.showWrong = false})
//       : super(key: key);
//   final _controller = Get.put(Btncontroller());

//   @override
//   Widget build(BuildContext context, ref) {
//     useEffect(() {
//       Future.delayed(const Duration(milliseconds: 100), () async {
//         ref.read(modelTestAnswerProvider(modelTestAnsModel).notifier).init();
//       });
//       return null;
//     }, []);
//     final quesList = ref.watch(modelTestAnswerProvider(modelTestAnsModel)
//         .select((value) => value.answers));

//     for (var i = 0; i < quesList.length; i++) {
//       if (quesList[i].submit_ans == quesList[i].right_ans) {
//         _controller.quize2anwseradd(1, 0);
//       } else {
//         _controller.quize2anwseradd(0, 1);
//       }
//     }
//     return Column(
//       children: [
//         ListView.separated(
//           physics: NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: quesList.length,
//           itemBuilder: (context, index) {
//             final question = quesList[index];
//             return AnswerCard(
//                 index: index,
//                 showWrong: showWrong,
//                 answer: (ans) {},
//                 length: quesList.length,
//                 question: question);
//           },
//           separatorBuilder: (context, index) => SizedBox(
//             height: 40,
//           ),
//         ),
//         SizedBox(
//           width: 130,
//           child: ElevatedButton(
//             onPressed: () {
//               if (showWrong) {
//                 Navigator.pop(context);
//               } else {
//                 ref
//                     .read(modelTestAnswerProvider(modelTestAnsModel).notifier)
//                     .submitModelTestAnswer();
//                 Navigator.of(context).pop();
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => ModelTestCorrectAnswers(
//                       modelTestInfoModel: modelTestAnsModel.copyWith(
//                           exam_info: quesList.unlock),
//                     ),
//                   ),
//                 );
//               }
//             },
//             child: Transform.translate(
//               offset: Offset(0, 0),
//               child: Text(showWrong ? 'Ok' : 'Submit'),
//             ),
//             style: ElevatedButton.styleFrom(),
//           ),
//         ),
//       ],
//     );
//   }
// }

// // class AnswerList extends ConsumerStatefulWidget {
// //   final ModelTestAnsModel modelTestAnsModel;
// //   final bool showWrong;
// //   AnswerList(
// //       {required this.modelTestAnsModel, required this.showWrong, Key? key})
// //       : super(key: key);

// //   @override
// //   ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreen();
// // }

// // class _HomeScreen extends ConsumerState<AnswerList> {
// //   final _controller = Get.put(Btncontroller());

// //   IList<ModelTestInfoModel>? quesList;

// //   bool loading = false;

// //   void loaddata() {
// //     setState(() {
// //       loading = true;
// //     });
// //     useEffect(() {
// //       Future.delayed(const Duration(milliseconds: 100), () async {
// //         ref
// //             .read(modelTestAnswerProvider(widget.modelTestAnsModel).notifier)
// //             .init();
// //       });
// //       return null;
// //     }, []);
// //     quesList = ref.watch(modelTestAnswerProvider(widget.modelTestAnsModel)
// //         .select((value) => value.answers));

// //     for (var i = 0; i < quesList!.length; i++) {
// //       if (quesList![i].submit_ans == quesList![i].right_ans) {
// //         _controller.quize2anwseradd(1, 0);
// //       } else {
// //         _controller.quize2anwseradd(0, 1);
// //       }
// //     }
// //     setState(() {
// //       loading = false;
// //     });
// //   }

// //   @override
// //   void initState() {
// //     loaddata();
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return loading
// //         ? Center(
// //             child: CircularProgressIndicator(),
// //           )
// //         : Column(
// //             children: [
// //               ListView.separated(
// //                 physics: NeverScrollableScrollPhysics(),
// //                 shrinkWrap: true,
// //                 itemCount: quesList!.length,
// //                 itemBuilder: (context, index) {
// //                   final question = quesList![index];
// //                   return AnswerCard(
// //                       index: index,
// //                       showWrong: widget.showWrong,
// //                       answer: (ans) {},
// //                       length: quesList!.length,
// //                       question: question);
// //                 },
// //                 separatorBuilder: (context, index) => SizedBox(
// //                   height: 40,
// //                 ),
// //               ),
// //               SizedBox(
// //                 width: 130,
// //                 child: ElevatedButton(
// //                   onPressed: () {
// //                     if (widget.showWrong) {
// //                       Navigator.pop(context);
// //                     } else {
// //                       ref
// //                           .read(
// //                               modelTestAnswerProvider(widget.modelTestAnsModel)
// //                                   .notifier)
// //                           .submitModelTestAnswer();
// //                       Navigator.of(context).pop();
// //                       Navigator.of(context).push(
// //                         MaterialPageRoute(
// //                           builder: (context) => ModelTestCorrectAnswers(
// //                             modelTestInfoModel: widget.modelTestAnsModel
// //                                 .copyWith(exam_info: quesList!.unlock),
// //                           ),
// //                         ),
// //                       );
// //                     }
// //                   },
// //                   child: Transform.translate(
// //                     offset: Offset(0, 0),
// //                     child: Text(widget.showWrong ? 'Ok' : 'Submit'),
// //                   ),
// //                   style: ElevatedButton.styleFrom(),
// //                 ),
// //               ),
// //             ],
// //           );
// //   }
// // }
