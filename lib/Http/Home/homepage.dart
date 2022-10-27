import 'package:http/http.dart' as http;

import '../../Model/SubjectList/subjectlist.dart';
import '../../constant.dart';

class HttpHomePage {
  Future<Subjectlist?> subjectlist({required String apipath}) async {
    var request = http.Request('GET', Uri.parse('${baseurl}/api/${apipath}'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return subjectlistFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }
}
