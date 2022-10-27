import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nahid_24/constant.dart';

import '../../Model/Free_Course/free_courese_video.dart';
import '../../Model/Free_Course/free_course.dart';
import 'package:http/http.dart' as http;

class HttpFreeCourse {
  var box = Hive.box('user');
  Future<FreeCourse?> getfreecourse() async {
    var headers = {
      'Authorization': 'Bearer ${box.get('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('$baseurl/api/video-course'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return freeCourseFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<FreeCourseVideo?> getfreecoursevideo(String categoryid) async {
    var headers = {
      'Authorization': 'Bearer ${box.get('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'GET', Uri.parse('$baseurl/api/show-video-course/$categoryid'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return freeCourseVideoFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }
}
