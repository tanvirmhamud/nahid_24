import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import '../../constant.dart';
import '../../screens/auth/login_screen.dart';
import '../../utils/function/navigation.dart';

class HttpLogin {
  var box = Hive.box('user');

  Future login(
      {String? number, String? password, BuildContext? context}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('$baseurl/api/login'));
    request.body = json.encode({"number": number, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);
    print(responsedata.body);
    var jsondata = jsonDecode(responsedata.body);
    if (jsondata['message'] == "Login Successfull") {
      box.put('token', jsondata['token']);
      box.put('email', jsondata['info']['email']);
      box.put('name', jsondata['info']['name']);
      box.put('userid', jsondata['info']['id']);
      Navigator.of(context!).pushReplacement(MaterialPageRoute(
          builder: (context) => NavigationScreen(
                selectedIndex: 0,
              )));
    }
  }

  Future registation(
      {name, email, number, password, BuildContext? context}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('$baseurl/api/register'));
    request.body = json.encode(
        {"name": name, "email": email, "number": number, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var responsedata = await http.Response.fromStream(response);
    var jsondata = jsonDecode(responsedata.body);
    if (jsondata['error'] == true) {
      Fluttertoast.showToast(
          msg: jsonDecode(responsedata.body)['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: jsonDecode(responsedata.body)['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.of(context!).pushReplacement(
          MaterialPageRoute(builder: (context) => LogInScreen()));
    }
  }

  Future otpsend({String? email}) async {
    var request = http.Request('GET', Uri.parse('$baseurl/api/otp/$email'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);
    print(responsedata.body);
    if (response.statusCode == 200) {
      return jsonDecode(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future newpassword(
      {String? email, String? password, BuildContext? context}) async {
    var headers = {
      'Cookie':
          'XSRF-TOKEN=eyJpdiI6IkFSNmtYWEplZ1MwNVpKeGtwOERkNGc9PSIsInZhbHVlIjoiL3A0SDVXMFRkeDZMM1BhU2ZNL1hUUWZGbExpNXcrQkp3MWcrS0pwcXZUQ3ZlbkpmSHhNdTZ2ZEUzU3IrZis5VjkvVEZjK0FDSlZhMm5sejlPL1BFUzcwTTB2bmxiMElvb1U1ZjRNT0gxQ0lvUVFUZ2dyOWVQK2VJS2FVQ2JqRHAiLCJtYWMiOiI2ZmEyMTVmY2FmODc2ZDE2ZWUwZDQyOTIxN2MyM2VlNWEwZGYyOTNlNzJmMTA5NDQwZWZmMTNiNTE0NDVlN2NkIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6InlQMEcvdkt4cGk3Z0JkL2YvdmFBOGc9PSIsInZhbHVlIjoiL21MMHVGeCtoM25HbG5tQUxZc0JYaHQreHArMG5FcHF6cE1zQUFWTGpBaUZSV2FzTVRma3VuY2FsaDF3NjZlWjNiTVN3SGNMalo2RllNZHdHT0lGRXBVa1o3TWJER0ZlazV3WmI1cnpocWpCeWVBbHp2RnVhYXNBRXg1ei83RmwiLCJtYWMiOiJkY2M1ZDY0OTFiOTU5OTk2Y2E3ZDcyYjAxNTVmZDk3ZWE1OGFiOTA1ZThlYmI1YTVkZmJjY2Y1NTU1MWUyYWNkIiwidGFnIjoiIn0%3D'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://lolipchat.com/app/public/api/forget'));
    request.fields.addAll({'email': email!, 'password': password!});

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
    Navigator.pushAndRemoveUntil(
        context!,
        MaterialPageRoute(builder: ((context) => LogInScreen())),
        (route) => false);
  }
}
