import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:nahid_24/constant.dart';

import '../../Model/Getmyorder/gtmyorder.dart';

class HttpOrder {
  

    var box = Hive.box('user');


  Future<Getnyorder?> getorder() async {
    var headers = {
      'Authorization': 'Bearer ${box.get('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'GET', Uri.parse('$baseurl/api/order'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return getnyorderFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }
}
