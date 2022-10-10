import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nahid_24/constant.dart';

class HttpDeliveryCharge {
  Future getdeiveryCharge() async {
    var request =
        http.Request('GET', Uri.parse('$baseurl/api/delivery_charge'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return json.decode(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }
}
