import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:nahid_24/constant.dart';

class Httpresult {
  var box = Hive.box('user');
  Future getexamresult() async {
    var headers = {
      'Authorization': 'Bearer ${box.get('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'GET', Uri.parse('$baseurl/api/My_Exam_Result'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    return jsonDecode(responsedata.body);
  }

  Future modelresult() async {
    var headers = {
      'Authorization': 'Bearer ${box.get('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET',
        Uri.parse('$baseurl/api/My_Model_Test_Result'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    return jsonDecode(responsedata.body);
  }

  Future getquizeresult() async {
    var headers = {
      'Authorization': 'Bearer ${box.get('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'GET', Uri.parse('$baseurl/api/My_Quiz_Results'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);
    return jsonDecode(responsedata.body);
  }
}
