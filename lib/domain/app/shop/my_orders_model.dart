// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class MyOrdersModel extends Equatable {
  final int id;
  final String user_id;
  final String total_bill;
  final String info;
  final String status;
  final String created_at;
  const MyOrdersModel({
    required this.id,
    required this.user_id,
    required this.total_bill,
    required this.info,
    required this.status,
    required this.created_at,
  });

  MyOrdersModel copyWith({
    int? id,
    String? user_id,
    String? total_bill,
    String? info,
    String? status,
    String? created_at,
  }) {
    return MyOrdersModel(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      total_bill: total_bill ?? this.total_bill,
      info: info ?? this.info,
      status: status ?? this.status,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': user_id,
      'total_bill': total_bill,
      'info': info,
      'status': status,
      'created_at': created_at,
    };
  }

  factory MyOrdersModel.fromMap(Map<String, dynamic> map) {
    return MyOrdersModel(
      id: map['id'] as int,
      user_id: map['user_id'] as String,
      total_bill: map['total_bill'] as String,
      info: map['info'] as String,
      status: map['status'] as String,
      created_at: map['created_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MyOrdersModel.fromJson(String source) =>
      MyOrdersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      user_id,
      total_bill,
      info,
      status,
      created_at,
    ];
  }

  factory MyOrdersModel.init() => const MyOrdersModel(
      id: 0, user_id: '', total_bill: '', info: '', status: '', created_at: '');
}
