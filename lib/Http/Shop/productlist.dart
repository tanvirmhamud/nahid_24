import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nahid_24/constant.dart';

import '../../domain/app/Product/product_list.dart';

class Httpproductlist {
  Future<ProductList?> getproductlist() async {
    var request = http.Request('GET', Uri.parse('$baseurl/api/product'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return ProductList.fromJson(jsonDecode(responsedata.body));
    } else {
      print(response.reasonPhrase);
    }
  }
}
