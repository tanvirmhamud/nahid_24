import 'package:hive/hive.dart';
import 'package:nahid_24/constant.dart';

import '../../Model/Suggestion/pdflist.dart';
import '../../Model/Suggestion/suggestionlist.dart';
import 'package:http/http.dart' as http;

class HttpSuggestion {
  var box = Hive.box('user');
  Future<SuggestionList?> getsuggestionlist() async {
    var headers = {
      'Authorization': 'Bearer ${box.get('token')}',
      'Content-Type': 'application/json'
    };
    var request =
        http.Request('GET', Uri.parse('$baseurl/api/suggestion-categories'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return suggestionListFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<Pdflist?> getpdflist({String? topicid}) async {
    print(topicid);
    var headers = {
      'Authorization': 'Bearer 1649|SuUjTB0ZZRGLy6PXG3WzK4rmNECD8S5es63rIqN7',
      'Content-Type': 'application/json'
    };
    var request =
        http.Request('GET', Uri.parse('$baseurl/api/suggestion-pdfs/$topicid'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      print(responsedata.body);
      return pdflistFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }
}
