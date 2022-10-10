// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int id;
  final String name;
  final String desc;
  final String price;
  final String photo;
  const ProductModel({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.photo,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    String? desc,
    String? price,
    String? photo,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'photo': photo,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      name: map['name'] as String,
      desc: map['desc'] as String,
      price: map['price'] as String,
      photo: map['photo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      desc,
      price,
      photo,
    ];
  }

  factory ProductModel.init() =>
      const ProductModel(id: 0, name: '', desc: '', price: '', photo: '');
}
