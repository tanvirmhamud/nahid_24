// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ModelTestSubjectModel extends Equatable {
  final int id;
  final String title_id;
  final String test_subject;
  final String created_at;
  const ModelTestSubjectModel({
    required this.id,
    required this.title_id,
    required this.test_subject,
    required this.created_at,
  });

  ModelTestSubjectModel copyWith({
    int? id,
    String? title_id,
    String? test_subject,
    String? created_at,
  }) {
    return ModelTestSubjectModel(
      id: id ?? this.id,
      title_id: title_id ?? this.title_id,
      test_subject: test_subject ?? this.test_subject,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title_id': title_id,
      'test_subject': test_subject,
      'created_at': created_at,
    };
  }

  factory ModelTestSubjectModel.fromMap(Map<String, dynamic> map) {
    return ModelTestSubjectModel(
      id: map['id'] as int,
      title_id: map['title_id'] as String,
      test_subject: map['test_subject'] as String,
      created_at: map['created_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelTestSubjectModel.fromJson(String source) =>
      ModelTestSubjectModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, title_id, test_subject, created_at];

  factory ModelTestSubjectModel.init() => ModelTestSubjectModel(
      id: 0, title_id: '', test_subject: '', created_at: '');
}
