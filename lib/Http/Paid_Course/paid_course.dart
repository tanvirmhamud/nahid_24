import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:nahid_24/constant.dart';

import '../../Model/Paid_Course/paid_course.dart';
import 'package:http/http.dart' as http;

import '../../Model/Paid_Course/paid_course_details.dart';
import '../../Model/Paid_Course/paid_course_order_history.dart';
import '../../Model/Paid_Course/paid_course_video.dart';

class HttpPAidCourse {
  var box = Hive.box('user');
  Future<PaidCourse?> getpaidcourse() async {
    var headers = {
      'Authorization': 'Bearer ${box.get('token')}',
      'Content-Type': 'application/json'
    };
    var request =
        http.Request('GET', Uri.parse('$baseurl/api/premium-courses'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 202) {
      return paidCourseFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<PaidCoursedetails?> getpaidcoursedetails(String paidcourseid) async {
    var headers = {
      'Authorization': 'Bearer ${box.get('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'GET', Uri.parse('$baseurl/api/premium-course/detail/$paidcourseid'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 202) {
      return paidCoursedetailsFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<PaidCoursevideo?> getpaidcoursevideo(String paidcourseid) async {
    var headers = {
      'Authorization': 'Bearer ${box.get('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'GET', Uri.parse('$baseurl/api/premium-course/$paidcourseid/videos'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);
    print("shakil ${responsedata.body}");
    if (response.statusCode == 202) {
      return paidCoursevideoFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future paidcourseorder(
      {String? paidcourseid,
      String? username,
      String? number,
      String? paymentmethod,
      String? payment_number,
      String? amount}) async {
    var headers = {
      'Authorization': 'Bearer ${box.get('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('$baseurl/api/premium-course/order'));
    request.fields.addAll({
      'premium_course_id': paidcourseid!,
      'user_name': username!,
      'number': number!,
      'payment_method': paymentmethod!,
      'payment_number': payment_number!,
      'amount': amount!
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);
    var jsondata = jsonDecode(responsedata.body);
    if (response.statusCode == 201) {
      print(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }

    Fluttertoast.showToast(
        msg: jsondata['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Future<PaidcourseOrderhistory?> paidcoursehistory() async {
    var headers = {
      'Authorization': 'Bearer ${box.get('token')}',
      'Content-Type': 'application/json'
    };
    var request =
        http.Request('GET', Uri.parse('$baseurl/api/my-premium-course/order'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 202) {
      return paidcourseOrderhistoryFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }
}
