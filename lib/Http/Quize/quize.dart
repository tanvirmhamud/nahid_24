import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nahid_24/constant.dart';

import '../../Model/examtopic.dart';
import '../../Model/quizelist.dart';
import '../../Model/examsubject.dart';
import 'package:http/http.dart' as http;

import '../../Model/submitmodel.dart';

class HttpExam {
  var box = Hive.box('user');

  Future<ExamSubject?> getexam() async {
    var request = http.Request('GET', Uri.parse('$baseurl/api/Exam_subjects'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return examSubjectFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<ExamTopic?> getexamtopic(int subjectid) async {
    var request =
        http.Request('GET', Uri.parse('$baseurl/api/Exam_subjects/$subjectid'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return examTopicFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<QuizeList?> getquizelist(int topicid) async {
    var request =
        http.Request('GET', Uri.parse('$baseurl/api/Exam_Mcq/$topicid'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return quizeListFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  // Future<QuizeList?> getquizelist(int topicid) async {
  //   var request =
  //       http.Request('GET', Uri.parse('$baseurl/api/Exam_subjects/$topicid'));

  //   http.StreamedResponse response = await request.send();
  //   var responsedata = await http.Response.fromStream(response);

  //   if (response.statusCode == 200) {
  //     return quizeListFromJson(responsedata.body);
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }

  Future examsubmit(
      {String? quiz_topics_id,
      String? quiz_subject_id,
      List<SubmitmodelMcq>? subjectmodel}) async {
    var headers = {
      'Authorization': 'Bearer ${box.get('token')}',
      'Content-Type': 'application/json',
    };
    var request = http.Request('POST', Uri.parse('$baseurl/api/Take_Mcq'));
    request.body = json.encode({
      "topic_id": quiz_topics_id,
      "subject_id": quiz_subject_id,
      "exam_info": List.generate(
        subjectmodel!.length,
        (index) => {
          "id": subjectmodel[index].id,
          "question": subjectmodel[index].question,
          "option1": subjectmodel[index].option1,
          "option2": subjectmodel[index].option2,
          "option3": subjectmodel[index].option3,
          "option4": subjectmodel[index].option4,
          "right_ans": subjectmodel[index].rightAns,
          "submit_ans": subjectmodel[index].submitAns
        },
      )
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var responsedata = await http.Response.fromStream(response);

    Fluttertoast.showToast(
        msg: jsonDecode(responsedata.body)['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
