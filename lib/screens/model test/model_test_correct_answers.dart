// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:get/get.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:nahid_24/domain/app/model_test/model_test_ans_model.dart';
// import 'package:nahid_24/screens/model%20test/widgets/answer_card.dart';
// import 'package:nahid_24/screens/model%20test/widgets/answer_list.dart';

// import '../../application/app/model_test/model_test_ans_provider.dart';
// import '../../getx/selectbtn.dart';

// class ModelTestCorrectAnswers extends HookConsumerWidget {
//   final ModelTestAnsModel modelTestInfoModel;
//   ModelTestCorrectAnswers({Key? key, required this.modelTestInfoModel})
//       : super(key: key);

//   final _controller = Get.put(Btncontroller());

//   bool showWrong = true;

//   double getscore({int? right_ans, int? wrong}) {
//     double score = ((right_ans! * 1) - wrong! * 0.25).toDouble();

//     return score;
//   }

  

//   @override
//   Widget build(BuildContext context, ref) {

//     useEffect(() {
//       Future.delayed(const Duration(milliseconds: 100), () async {
//         ref.read(modelTestAnswerProvider(modelTestInfoModel).notifier).init();
//       });
//       return null;
//     }, []);
//     final quesList = ref.watch(modelTestAnswerProvider(modelTestInfoModel)
//         .select((value) => value.answers));

//     for (var i = 0; i < quesList.length; i++) {
//       if (quesList[i].submit_ans == quesList[i].right_ans) {
//         _controller.quize2anwseradd(1, 0);
//       } else {
//         _controller.quize2anwseradd(0, 1);
//       }
//     }
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: Text('Correct Answers'),
//         actions: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Obx(() {
//                 if (_controller.quize2rigthanwser != 0) {
//                   return Text(
//                       "Rigth anwser: ${_controller.quize2rigthanwser.value}  ");
//                 } else {
//                   return Text("Rigth anwser: 0");
//                 }
//               }),
//               Obx(() {
//                 if (_controller.quize2rigthanwser != 0) {
//                   return Text(
//                       "Wrong anwser: ${_controller.quize2wronganwser.value}  ");
//                 } else {
//                   return Text("Wrong anwser: 0");
//                 }
//               }),

//               Text(
//                   "Score: ${getscore(right_ans: _controller.quize2rigthanwser.value, wrong: _controller.quize2wronganwser.value)}")
//               // Obx(() {
//               // Text("Wrong anwser: ${_controller.quize2wronganwser}"),

//               // Obx(() {
//               //   return Text("Score: ${0}");
//               // }),
//             ],
//           ),
//         ],
//       ),
//       // body: SingleChildScrollView(
//       //   child: AnswerList(
//       //     showWrong: true,
//       //     modelTestAnsModel: modelTestInfoModel,
//       //   ),
//       // ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             ListView.separated(
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: quesList.length,
//               itemBuilder: (context, index) {
//                 final question = quesList[index];
//                 return AnswerCard(
//                     index: index,
//                     showWrong: true,
//                     answer: (ans) {},
//                     length: quesList.length,
//                     question: question);
//               },
//               separatorBuilder: (context, index) => SizedBox(
//                 height: 40,
//               ),
//             ),
//             SizedBox(
//               width: 130,
//               child: ElevatedButton(
//                 onPressed: () {
//                   if (showWrong) {
//                     Navigator.pop(context);
//                   } else {
//                     ref
//                         .read(modelTestAnswerProvider(modelTestInfoModel)
//                             .notifier)
//                         .submitModelTestAnswer();
//                     Navigator.of(context).pop();
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => ModelTestCorrectAnswers(
//                           modelTestInfoModel: modelTestInfoModel.copyWith(
//                               exam_info: quesList.unlock),
//                         ),
//                       ),
//                     );
//                   }
//                 },
//                 child: Transform.translate(
//                   offset: Offset(0, 0),
//                   child: Text(showWrong ? 'Ok' : 'Submit'),
//                 ),
//                 style: ElevatedButton.styleFrom(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
