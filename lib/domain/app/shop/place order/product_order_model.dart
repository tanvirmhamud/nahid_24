// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:nahid_24/domain/app/shop/place%20order/product_amount_model.dart';

class ProductOrderModel extends Equatable {
  final List<ProductAmountModel> product_info;
  const ProductOrderModel({
    required this.product_info,
  });

  ProductOrderModel copyWith({
    List<ProductAmountModel>? product_info,
  }) {
    return ProductOrderModel(
      product_info: product_info ?? this.product_info,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product_info': product_info.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductOrderModel.fromMap(Map<String, dynamic> map) {
    return ProductOrderModel(
      product_info: List<ProductAmountModel>.from(
        (map['product_info'] as List<int>).map<ProductAmountModel>(
          (x) => ProductAmountModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductOrderModel.fromJson(String source) =>
      ProductOrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [product_info];

  factory ProductOrderModel.init() => const ProductOrderModel(product_info: []);
}
