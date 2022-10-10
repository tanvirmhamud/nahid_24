// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:nahid_24/application/app/model_test/model_test_ans_provider.dart';
// import 'package:nahid_24/domain/app/model_test/model_test_ans_model.dart';
// import 'package:nahid_24/screens/model%20test/model_test_correct_answers.dart';

// import 'answer_card.dart';

// class ModelTestBody extends HookConsumerWidget {
//   final ModelTestAnsModel modelTestAnsModel;

//   const ModelTestBody({Key? key, required this.modelTestAnsModel})
//       : super(key: key);

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
//                 answer: (ans) {
//                   ref
//                       .read(modelTestAnswerProvider(modelTestAnsModel).notifier)
//                       .updateAnswer(index, ans);
//                 },
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
//               ref
//                   .read(modelTestAnswerProvider(modelTestAnsModel).notifier)
//                   .submitModelTestAnswer();
//               Navigator.of(context).pop();
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => ModelTestCorrectAnswers(
//                     modelTestInfoModel:
//                         modelTestAnsModel.copyWith(exam_info: quesList.unlock),
//                   ),
//                 ),
//               );
//             },
//             child: Transform.translate(
//               offset: Offset(0, 0),
//               child: Text('Submit'),
//             ),
//             style: ElevatedButton.styleFrom(),
//           ),
//         ),
//       ],
//     );
//   }
// }
