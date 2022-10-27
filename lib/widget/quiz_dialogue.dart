import 'dart:ffi';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nahid_24/Provider/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/quizesubject.dart';
import '../New_Design/quiz/quizepage2.dart';

class QuizeDialogue extends StatefulWidget {
  const QuizeDialogue({Key? key}) : super(key: key);

  @override
  State<QuizeDialogue> createState() => _QuizeDialogueState();
}

class _QuizeDialogueState extends State<QuizeDialogue> {
  bool loading = true;

  Future loaddata() async {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    await provider.getquizesubject();
    setState(() {
      loading = false;
    });
  }

  Quizesubject? quizesubject;

  @override
  void initState() {
    loaddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    return Dialog(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              width: double.infinity,
              height: 30,
              decoration: BoxDecoration(
                  color: Color(0xf045de9).withOpacity(0.90),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: Text(
                "বিষয় নির্বাচন করুন",
                style: TextStyle(color: Colors.white),
              )),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              child: loading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      itemCount: provider.httpQuize2!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 30,
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 5,
                      ),
                      itemBuilder: (BuildContext, index) {
                        var data = provider.httpQuize2![index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              quizesubject = data;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 2.0,
                                  spreadRadius: 0.0,
                                  offset: Offset(2.0,
                                      2.0), // shadow direction: bottom right
                                )
                              ],
                            ),
                            child: Card(
                              color: quizesubject == data
                                  ? Colors.purple.withOpacity(0.9)
                                  : Colors.white,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                height: 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      data.title!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: quizesubject == data
                                              ? Colors.white
                                              : Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
            ),
            if (quizesubject != null && quizesubject!.subjects!.isNotEmpty)
              Column(
                children: [
                  Divider(),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    width: double.infinity,
                    height: 30.h,
                    decoration: BoxDecoration(
                        color: Color(0xf045de9).withOpacity(0.90),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      "Please select topic",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  // Text('Please select topic'),
                ],
              )
            else if (quizesubject != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: Text('No Topic Available'),
              ),
            if (quizesubject != null && quizesubject!.subjects!.isNotEmpty)
              GridView.builder(
                  shrinkWrap: true,
                  itemCount: quizesubject!.subjects!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 30,
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 5,
                  ),
                  itemBuilder: (BuildContext, index) {
                    final subject = quizesubject!.subjects![index];
                    return GestureDetector(
                      onTap: () {
                        // Navigator.of(context).pop(subject.id);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Quize2page(
                                      name: subject.topicName!,
                                      subjectid:
                                          int.parse(subject.quizSubjectId!),
                                      topicid: subject.id!,
                                    )));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 2.0,
                              spreadRadius: 0.0,
                              offset: Offset(
                                  2.0, 2.0), // shadow direction: bottom right
                            )
                          ],
                        ),
                        child: Card(
                          color: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            height: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  subject.topicName!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
          ],
        ),
      ),
    );
  }


}
