import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../Http/Model/model_subject.dart';
import '../../Model/model_text_topic.dart';
import 'model_question.dart';

class ModelTexttopicPage extends StatefulWidget {
  final int subjectid;
  const ModelTexttopicPage({Key? key, required this.subjectid})
      : super(key: key);

  @override
  State<ModelTexttopicPage> createState() => _ModelTexttopicPageState();
}

class _ModelTexttopicPageState extends State<ModelTexttopicPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<Modeltexttopic?>(
          future: HttpModel().getmodeltexttopic(widget.subjectid),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 6.0,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: ((context, index2) {
                    var data = snapshot.data!.data![index2];

                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => ModelQuestionPage(
                                        name: data.testTopicName!,
                                        topicid: data.id!,
                                        testsubjectid: data.testSubjectId!,
                                        titleid: data.titleId!,
                                      ))));
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(data.testTopicName!),
                        ));
                  }));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
    );
  }
}
