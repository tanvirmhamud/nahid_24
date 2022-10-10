import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../Http/Scorebord/scorebord.dart';
import '../../Model/lavel_scorebord.dart';

class ModelLavelBoardPage extends StatefulWidget {
  final String titleid;
  final String test_subject_id;
  final String test_topic_id;
  const ModelLavelBoardPage(
      {Key? key,
      required this.titleid,
      required this.test_subject_id,
      required this.test_topic_id})
      : super(key: key);

  @override
  State<ModelLavelBoardPage> createState() => _ModelLavelBoardPageState();
}

class _ModelLavelBoardPageState extends State<ModelLavelBoardPage> {
  List<LavelScoreboard>? fast3position;
  List<LavelScoreboard>? allscorebord;

  bool loading = true;
  var box = Hive.box('user');

  Future loaddata() async {
    var data = await Httpscorebord().modelscorebord(
        test_subject_id: widget.test_subject_id,
        test_topic_id: widget.test_topic_id,
        titleid: widget.titleid);

    fast3position = data!
        .where((element) =>
            element.position == 1 ||
            element.position == 2 ||
            element.position == 3)
        .toList();
    allscorebord = data;
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    loaddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 400,
                    width: double.infinity,
                    color: Colors.indigo,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: List.generate(
                        fast3position!.length,
                        (index) => Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(
                                  fast3position![index].user!.isNotEmpty
                                      ? fast3position![index]
                                              .user!
                                              .first
                                              .image ??
                                          ""
                                      : ""),
                            ),
                            Text(
                                fast3position![index].user!.isNotEmpty
                                    ? fast3position![index].user!.first.name!
                                    : "",
                                style: TextStyle(color: Colors.white)),
                            Container(
                              height: index == 0
                                  ? 250
                                  : index == 1
                                      ? 200
                                      : 150,
                              width: 70,
                              color: index == 0
                                  ? Colors.indigoAccent
                                  : index == 1
                                      ? Colors.orange
                                      : Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                      itemCount: allscorebord!.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        var data = allscorebord![index];
                        return Card(
                          color: data.user!.first.id == box.get('userid')
                              ? Colors.indigo
                              : Colors.white,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Text(
                                  "${data.position}",
                                  style: TextStyle(
                                      color: data.user!.first.id ==
                                              box.get('userid')
                                          ? Colors.white
                                          : Colors.black),
                                ),
                                SizedBox(width: 10),
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage(
                                      data.user!.isNotEmpty
                                          ? data.user!.first.image ?? ""
                                          : ""),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  data.user!.isNotEmpty
                                      ? data.user!.first.name!
                                      : "",
                                  style: TextStyle(
                                      color: data.user!.first.id ==
                                              box.get('userid')
                                          ? Colors.white
                                          : Colors.black),
                                ),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.indigo.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    data.totalMark.toString(),
                                    style: TextStyle(
                                        color: data.user!.first.id ==
                                                box.get('userid')
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }))
                ],
              ),
            ),
    );
  }
}
