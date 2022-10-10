import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nahid_24/constant.dart';

class HttpSlider {
  Future getslider() async {
    var request = http.Request('GET', Uri.parse('$baseurl/api/sliders'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return jsonDecode(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }
}
