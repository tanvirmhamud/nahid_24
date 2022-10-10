import 'package:nahid_24/constant.dart';

import '../../Model/search.dart';
import 'package:http/http.dart' as http;

class Httpsearch {
  Future<SearchData?> getsearchdata({String? key}) async {
    var request =
        http.Request('GET', Uri.parse('$baseurl/api/Search/Video/$key'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    print(responsedata.body);
    return searchDataFromJson(responsedata.body);
  }
}
