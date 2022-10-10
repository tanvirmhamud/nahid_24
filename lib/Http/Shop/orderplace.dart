import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:nahid_24/constant.dart';

import '../../domain/app/shop/place order/product_amount_model.dart';

class HttporderPlace {
  var box = Hive.box('user');

  Future orderplace({List<ProductAmountModel>? orderProduct}) async {
    var headers = {
      'Authorization': 'Bearer ${box.get('token')}',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('$baseurl/api/order'));
    request.body = json.encode({
      "product_info": List.generate(
        orderProduct!.length,
        (index) => {
          "product_id": orderProduct[index].id,
          "quantity": orderProduct[index].quantity
        },
      )
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);
    return jsonDecode(responsedata.body);

    print("tanvir ${responsedata.body}");
  }
}
