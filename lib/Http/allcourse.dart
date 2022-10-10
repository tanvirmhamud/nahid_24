

import '../Model/allcource.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';

class HttpAllcource {
  Future<Allcource?> getallcource() async {
    var headers = {
      'Cookie':
          'XSRF-TOKEN=eyJpdiI6ImdSR0VOQ1dVV2t0M2R6bkdQd3l1Qmc9PSIsInZhbHVlIjoiaUpiNS9yekVTN0JqM2w2QWZkY3ljZEM5UkhKdXhJN3RZZ3NlODVtaU5uc1AwRE9BTnRYelNYNldBQmtkNmNZT1N0R3VVZUhwUkNJSll3UjFKalVWQktpWUEvdEN1NWRqc2h5dDF5UFhMUEVLMVNVRGdDdVNpQjd3ZGpKZ29CY0giLCJtYWMiOiI1NDZjMjM0ZmUwZTY5OTMwMDhhODViMzg2NTFhNzM0Y2MzN2ZjODY1ZDg3OWY2ZWExMTRmNGI2ZDlkMWJiYTAwIiwidGFnIjoiIn0%3D; laravel_session=eyJpdiI6IjI3MUE3Ymc5SllDbnVwQnJKK01RWFE9PSIsInZhbHVlIjoiVG1ZNVhzTUZFTXlXbVhKbjkvdWhLakFIMHJLK2tuZmJvVUEvaS84cjhYK2luNFZiM2RtQ2VPOUpuY0xhUTlIWTd2WllneXR0eGduUVRFajYwelNYeUFnNmlxcE9ieCtIUUI2elNnZHdodXp2Z0hWV240MklKWkxhSU92ejl6UnAiLCJtYWMiOiIwZTJjODBmOGFkYWM4ZTA1ZGUxOGQ3NTMyNDhhODM0Zjc3NTU0OGMyNzIxNmNhMDE4NmFiM2RlOTdkNTNkMGM1IiwidGFnIjoiIn0%3D'
    };
    var request = http.Request(
        'GET', Uri.parse('$baseurl/api/all_courses'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return allcourceFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }
}
