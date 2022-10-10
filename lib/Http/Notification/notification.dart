import 'package:hive/hive.dart';
import 'package:nahid_24/constant.dart';

import '../../Model/notification.dart';
import 'package:http/http.dart' as http;

class HttpNotification {
  var box = Hive.box('user');
  Future<NotificationDAta?> getnotification() async {
    var headers = {
      'Authorization': 'Bearer ${box.get('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('$baseurl/api/notifications'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return notificationFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }
}
