import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nahid_24/constant.dart';

import '../../Model/quize2list.dart';
import 'package:http/http.dart' as http;

import '../../Model/quize2submit.dart';
import '../../Model/quizesubject.dart';

class HttpQuize2 {
  var box = Hive.box('user');

  Future<List<Quizesubject>?> getquizelist() async {
    var request = http.Request('GET', Uri.parse('$baseurl/api/quiz_subjects'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    return quizesubjectFromJson(responsedata.body);
  }

  Future<Quize2List?> getquize2list(int subjectid) async {
    var request =
        http.Request('GET', Uri.parse('$baseurl/api/quiz_subjects/$subjectid'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);
    print(responsedata.body);
    return quize2ListFromJson(responsedata.body);
  }

  Future submitquize2(
      {List<Quize2Data>? quize2data, quiz_topics_id, quiz_subject_id}) async {
    var headers = {
      'Authorization': 'Bearer ${box.get('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('$baseurl/api/Take_Quiz'));
    request.body = json.encode({
      "quiz_topics_id": quiz_topics_id,
      "quiz_subject_id": quiz_subject_id,
      "exam_info": List.generate(
        quize2data!.length,
        (index) => {
          "id": quize2data[index].id,
          "question": quize2data[index].question,
          "option1": quize2data[index].option1,
          "option2": quize2data[index].option2,
          "option3": quize2data[index].option3,
          "option4": quize2data[index].option4,
          "right_ans": quize2data[index].rightAns,
          "submit_ans": quize2data[index].submitAns
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
