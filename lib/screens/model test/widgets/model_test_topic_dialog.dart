// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:nahid_24/application/app/model_test/model_test_provider.dart';
// import 'package:nahid_24/domain/app/model_test/model_test_topic/model_test_topic_model.dart';

// class ModelTestTopicDialog extends HookConsumerWidget {
//   final int subjectId;
//   const ModelTestTopicDialog({Key? key, required this.subjectId})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context, ref) {
//     useEffect(() {
//       Future.delayed(const Duration(seconds: 1), () async {
//         ref.read(modelTestProvider(subjectId).notifier).getAllModelTestTopic();
//       });
//       return null;
//     }, []);

//     final state = ref.watch(modelTestProvider(subjectId));
//     final ValueNotifier<ModelTestTopicModel?> selectedQuiz = useState(null);
//     return Container(
//       color: Colors.white,
//       padding: EdgeInsets.symmetric(horizontal: 10),
//       child: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.symmetric(vertical: 5),
//             padding: EdgeInsets.symmetric(
//               horizontal: 10,
//             ),
//             width: double.infinity,
//             height: 30,
//             decoration: BoxDecoration(
//                 color: Color(0xf045de9).withOpacity(0.90),
//                 borderRadius: BorderRadius.circular(20)),
//             child: Center(
//                 child: Text(
//               "বিষয় নির্বাচন করুন",
//               style: TextStyle(color: Colors.white),
//             )),
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Expanded(
//             child: state.loading
//                 ? Center(
//                     child: CircularProgressIndicator(
//                       color: Colors.blue,
//                     ),
//                   )
//                 : GridView.builder(
//                     itemCount: state.modelTopics.length,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       mainAxisExtent: 30,
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 8,
//                       mainAxisSpacing: 5,
//                     ),
//                     itemBuilder: (BuildContext, index) {
//                       return GestureDetector(
//                         onTap: () {
//                           selectedQuiz.value = state.modelTopics[index];
//                           Navigator.of(context).pop(selectedQuiz.value);
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.1),
//                                 blurRadius: 2.0,
//                                 spreadRadius: 0.0,
//                                 offset: Offset(
//                                     2.0, 2.0), // shadow direction: bottom right
//                               )
//                             ],
//                           ),
//                           child: Card(
//                             color:
//                                 selectedQuiz.value == state.modelTopics[index]
//                                     ? Colors.purple.withOpacity(0.9)
//                                     : Colors.white,
//                             elevation: 2,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Container(
//                               height: 5,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     state.modelTopics[index].test_topic_name,
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: selectedQuiz.value ==
//                                               state.modelTopics[index]
//                                           ? Colors.white
//                                           : Colors.black,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }

//   static Future<ModelTestTopicModel?> show(
//           BuildContext context, int subjectId) =>
//       showDialog<ModelTestTopicModel?>(
//         context: context,
//         builder: (context) => Dialog(
//           clipBehavior: Clip.hardEdge,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//           child: Container(
//             height: MediaQuery.of(context).size.height / 2,
//             child: ModelTestTopicDialog(subjectId: subjectId),
//           ),
//         ),
//       );
// }
