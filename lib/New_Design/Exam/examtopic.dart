import 'package:flutter/material.dart';
import 'package:nahid_24/New_Design/Exam/quizelist.dart';
import '../../Http/Quize/quize.dart';
import '../../Model/examtopic.dart';
import '../Model/model_question.dart';

class ExamTopicPage extends StatefulWidget {
  final int subjectid;
  const ExamTopicPage({Key? key, required this.subjectid}) : super(key: key);

  @override
  State<ExamTopicPage> createState() => _ExamTopicPageState();
}

class _ExamTopicPageState extends State<ExamTopicPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: FutureBuilder<ExamTopic?>(
            future: HttpQuize().getexamtopic(widget.subjectid),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  margin: EdgeInsets.all(10),
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.data!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 4.0,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemBuilder: ((context, index2) {
                        var data = snapshot.data!.data![index2];

                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => QuizeListPage(
                                            name: data.topicName!,
                                            topicid: data.id!,
                                            quizesubjectid: data.subjectId!,
                                          ))));
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 10),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  color: Color(0xFF0056DA),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                data.topicName!,
                                style: TextStyle(color: Colors.white),
                              ),
                            ));
                      })),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            })),
      ),
    );
  }
}
