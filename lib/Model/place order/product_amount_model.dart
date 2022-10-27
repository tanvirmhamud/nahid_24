// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class ProductAmountModel  {
  final int id;
  final int quantity;
  const ProductAmountModel({
    required this.id,
    required this.quantity,
  });

  ProductAmountModel copyWith({
    int? id,
    int? quantity,
  }) {
    return ProductAmountModel(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product_id': id,
      'quantity': quantity,
    };
  }

  factory ProductAmountModel.fromMap(Map<String, dynamic> map) {
    return ProductAmountModel(
      id: map['product_id'] as int,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductAmountModel.fromJson(String source) =>
      ProductAmountModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, quantity];

  factory ProductAmountModel.init() =>
      const ProductAmountModel(id: 0, quantity: 0);
}
