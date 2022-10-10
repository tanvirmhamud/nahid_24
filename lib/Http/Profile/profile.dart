import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nahid_24/constant.dart';

import '../../Model/profile.dart';
import 'package:http/http.dart' as http;

class Httpprofile {
  var box = Hive.box('user');

  Future<Profile?> getprofile() async {
    var headers = {
      'Authorization': 'Bearer ${box.get('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('$baseurl/api/Profile'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return profileFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future proileupdate({String? name, number, institute}) async {
    var headers = {
      'Authorization': 'Bearer ${box.get('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('PUT', Uri.parse('$baseurl/api/Profile'));
    request.body =
        json.encode({"name": name, "number": number, "institute": institute});
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

  Future imageupload({String? path}) async {
    var headers = {
      'Authorization': 'Bearer ${box.get('token')}',
      'Content-Type': 'application/json'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse('$baseurl/api/Profile/image'));
    request.files.add(await http.MultipartFile.fromPath('photo', path!));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
