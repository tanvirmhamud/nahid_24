import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:nahid_24/constant.dart';

import '../../Model/model_subject.dart';
import '../../Model/model_text_topic.dart';
import '../../Model/modeltestmcq.dart';
import '../../Model/submitmodel.dart';

class HttpModel {
  var box = Hive.box('user');

  Future<List<ModelSubject>?> getmodelsubject() async {
    var request = http.Request('GET', Uri.parse('$baseurl/api/Model_Test'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return modelSubjectFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<Modeltexttopic?> getmodeltexttopic(int subjectid) async {
    var request =
        http.Request('GET', Uri.parse('$baseurl/api/Model_Test/$subjectid'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return modeltexttopicFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<Modeltestmcq?> getmodeltestmcq(int topicid) async {
    var request =
        http.Request('GET', Uri.parse('$baseurl/api/Exam_Model/$topicid'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return modeltestmcqFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future submitmodeltest(
      {String? titleid,
      String? test_subject_id,
      String? test_topic_id,
      List<SubmitmodelMcq>? subjectmodel}) async {
    var headers = {
      'Authorization': 'Bearer ${box.get('token')}',
      'Content-Type': 'application/json'
    };
    var request =
        http.Request('POST', Uri.parse('$baseurl/api/Take_Model_Test'));
    request.body = json.encode({
      "title_id": titleid,
      "test_subject_id": test_subject_id,
      "test_topic_id": test_topic_id,
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
              })
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
