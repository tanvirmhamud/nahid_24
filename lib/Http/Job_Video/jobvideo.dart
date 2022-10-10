import 'package:http/http.dart' as http;
import 'package:nahid_24/constant.dart';

import '../../Model/allcource.dart';

class HttpJobVideo {
  Future<Allcource?> getjobvideo() async {
    var request = http.Request('GET', Uri.parse('$baseurl/api/Job_Video'));

    http.StreamedResponse response = await request.send();

    var responsedata = await http.Response.fromStream(response);
    return allcourceFromJson(responsedata.body);
  }
}
