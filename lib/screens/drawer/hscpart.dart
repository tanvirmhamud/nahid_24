// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../application/course/course_provider.dart';
// import '../../application/subject/subject_provider.dart';
// import '../course/course_page.dart';

// class HscPart extends ConsumerStatefulWidget {
//   final String classname;
//   final String name;
//   const HscPart( {Key? key, required this.classname,required this.name}) : super(key: key);

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _HscPart();
// }

// class _HscPart extends ConsumerState<HscPart> {
//   final List<String> sImage = ["assets/silder.jpg", "assets/slider2.jpg"];

//   int select2ndrow = 0;

//   List<String> classname = [];

//   @override
//   void initState() {
//     classname.add("HSC_Video_Subject");
//     Future.delayed(Duration(milliseconds: 100), () {
//       ref
//           .read(subjectProvider.notifier)
//           .getSubjectsList(className: widget.classname);
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.name),
//       ),
//       body: hscpart(),
//     );
//   }

//   Widget hscpart() {
//     final subjectsState = ref.watch(subjectProvider);
//     return Container(
//       color: Color(0xffE5E5E5),
//       padding: EdgeInsets.symmetric(horizontal: 10),
//       child: subjectsState.loading
//           ? Center(child: CircularProgressIndicator())
//           : subjectsState.subjects.isEmpty
//               ? Center(child: Text('No course available'))
//               : GridView.builder(
//                   itemCount: subjectsState.subjects.length,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     mainAxisExtent: 241,
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 8,
//                     mainAxisSpacing: 5,
//                   ),
//                   itemBuilder: (BuildContext, index) {
//                     final subject = subjectsState.subjects[index];
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => CoursePage(
//                                       subject: Subject(
//                                           subject: subject,
//                                           courseName: ref.watch(
//                                               subjectProvider.select(
//                                                   (value) => value.className))),
//                                     )));
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.1),
//                               blurRadius: 2.0,
//                               spreadRadius: 0.0,
//                               offset: Offset(
//                                   2.0, 2.0), // shadow direction: bottom right
//                             )
//                           ],
//                         ),
//                         child: Card(
//                           elevation: 2,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20)),
//                           child: Container(
//                             height: 5,
//                             child: SingleChildScrollView(
//                               child: Column(
//                                 children: [
//                                   CachedNetworkImage(
//                                       imageUrl: subject.thumbnail,
//                                       fit: BoxFit.cover,
//                                       errorWidget: (context, url, error) =>
//                                           SizedBox.shrink()),
//                                   Text(subject.subjectName)
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   }),
//     );
//   }
// }
