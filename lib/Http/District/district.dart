import 'package:http/http.dart' as http;
import 'package:nahid_24/Model/Alldistrict/subdistrict.dart';
import 'package:nahid_24/constant.dart';

import '../../Model/Alldistrict/alldistrict.dart';

class Httpdistrict {
  Future<Alldistrict?> getalldistrict() async {
    var request = http.Request('GET', Uri.parse('$baseurl/api/district'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return alldistrictFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<Subdistrict?> getsubdistrict(int districtid) async {
    var request =
        http.Request('GET', Uri.parse('$baseurl/api/sub-district/$districtid'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return subdistrictFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }
}
