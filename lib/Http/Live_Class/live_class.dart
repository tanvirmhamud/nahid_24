import 'package:hive/hive.dart';
import 'package:nahid_24/constant.dart';

import '../../Model/LiveClass/liveclass.dart';
import 'package:http/http.dart' as http;

import '../../Model/LiveClass/liveclass_detais.dart';
import '../../Model/LiveClass/liveclassorder.dart';
import '../../Model/LiveClass/liveclassvideo.dart';

class HttpLiveClass {
  var box = Hive.box('user');
  Future<LiveClass?> getliveclass() async {
    var headers = {
      'Authorization': 'Bearer ${box.get('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('$baseurl/api/live-classes'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 202) {
      return liveClassFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<LiveClassdetails?> getliveclassdetails(String liveclassid) async {
    var headers = {
      'Authorization': 'Bearer ${box.get('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'GET', Uri.parse('$baseurl/api/live-class/detail/$liveclassid'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 202) {
      return liveClassdetailsFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<LiveClassvideo?> getliveclassvideo(String liveclassid) async {
    var headers = {
      'Authorization': 'Bearer ${box.get('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'GET', Uri.parse('$baseurl/api/live-class/$liveclassid/videos'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 202) {
      return liveClassvideoFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future liveclassorder(
      {String? classid,
      name,
      number,
      paymentmethod,
      paymentnumber,
      trxid,
      annount}) async {
    var headers = {
      'Authorization': 'Bearer ${box.get('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.MultipartRequest('POST',
        Uri.parse('https://application.nahid24.com/api/live-class/order'));
    request.fields.addAll({
      'class_id': classid!,
      'user_name': name,
      'number': number,
      'payment_method': paymentmethod,
      'payment_number': paymentnumber,
      'transaction_id': trxid,
      'amount': annount
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<Liveclassorder?> getliveclassorder() async {
    var headers = {
      'Authorization': 'Bearer ${box.get('token')}',
      'Content-Type': 'application/json'
    };
    var request =
        http.Request('GET', Uri.parse('$baseurl/api/my-live-class/order'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 202) {
      return liveclassorderFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }
}
