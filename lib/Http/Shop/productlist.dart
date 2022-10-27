import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nahid_24/Model/Product/product_list.dart';
import 'package:nahid_24/constant.dart';

import '../../Model/Book_Product/book_details.dart';

class Httpproductlist {
  Future<Productlist?> getproductlist() async {
    var request = http.Request('GET', Uri.parse('$baseurl/api/product'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);
    print(responsedata.body);
    return productlistFromJson(responsedata.body);
  }

  Future<Bookproductdetaills?> bookproductdetails({String? productid}) async {
    var request = http.Request(
        'GET', Uri.parse('$baseurl/api/product/detail/$productid'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return bookproductdetaillsFromJson(responsedata.body);
    } else {
      print(responsedata.body);
    }
  }
}
