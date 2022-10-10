import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Http/Model/model_subject.dart';
import '../../Model/model_subject.dart';
import '../../getx/selectbtn.dart';
import 'model_test_topic.dart';

class ModelSubjectPage extends StatefulWidget {
  const ModelSubjectPage({Key? key}) : super(key: key);

  @override
  State<ModelSubjectPage> createState() => _ModelSubjectPageState();
}

class _ModelSubjectPageState extends State<ModelSubjectPage> {
  final _controller = Get.put(Btncontroller());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_controller.modelsubjectindex == 01984651465655646) {
        return modelsubject();
      } else {
        return ModelTexttopicPage(
          subjectid: _controller.modelsubjectid.value,
        );
      }
    });
  }

  Widget modelsubject() {
    return Material(
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.grey[100],
        child: FutureBuilder<List<ModelSubject>?>(
          future: HttpModel().getmodelsubject(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 10, top: 10),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          snapshot.data![index].title!,
                          style: TextStyle(color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xFF0056DA),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data![index].subjects!.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 6.0,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemBuilder: ((context, index2) {
                            var data = snapshot.data![index].subjects![index2];
                            
                            return InkWell(
                                onTap: () {
                                  print(index2);
                                  _controller.getmodelsubjectid(data.id!);
                                  _controller.selectmodelsubjectindex(index2);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(data.testSubject!),
                                ));
                          }))
                    ],
                  );
                }),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ),
      ),
    );
  }
}
