import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:nahid_24/constant.dart';

class HttpPayment {
  var box = Hive.box('user');
  Future paymentreq(
      {name,
      number,
      orderid,
      address,
      paymenttype,
      paymentnumber,
      String? trxid,
      district,
      upazila,
      union,
      amount}) async {
    print(trxid);
    var headers = {
      'Authorization': 'Bearer ${box.get('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('$baseurl/api/payment'));
    request.body = json.encode({
      // "user_id": box.get('userid'),
      // "order_id": orderid,
      // "name": name,
      // "email": box.get('email'),
      // "number": number,
      // "address": address ?? "",
      // "payment_type": paymenttype,
      // "trx_id": trxid,
      // "amount": amount ?? ""
      "user_id": box.get('userid'),
      "order_id": orderid,
      "name": name,
      "email": box.get('email'),
      "number": number,
      "payment_number": paymentnumber,
      "address": address ?? "",
      "payment_type": paymenttype,
      "trx_id": trxid,
      "amount": amount,
      "district": district,
      "upazila": upazila,
      "union": union
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
