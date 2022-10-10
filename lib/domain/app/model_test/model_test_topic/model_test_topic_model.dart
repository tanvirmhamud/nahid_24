// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ModelTestTopicModel extends Equatable {
  final int id;
  final String title_id;
  final String test_subject_id;
  final String test_topic_name;
  final String created_at;
  const ModelTestTopicModel({
    required this.id,
    required this.title_id,
    required this.test_subject_id,
    required this.test_topic_name,
    required this.created_at,
  });

  ModelTestTopicModel copyWith({
    int? id,
    String? title_id,
    String? test_subject_id,
    String? test_topic_name,
    String? created_at,
  }) {
    return ModelTestTopicModel(
      id: id ?? this.id,
      title_id: title_id ?? this.title_id,
      test_subject_id: test_subject_id ?? this.test_subject_id,
      test_topic_name: test_topic_name ?? this.test_topic_name,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title_id': title_id,
      'test_subject_id': test_subject_id,
      'test_topic_name': test_topic_name,
      'created_at': created_at,
    };
  }

  factory ModelTestTopicModel.fromMap(Map<String, dynamic> map) {
    return ModelTestTopicModel(
      id: map['id'] as int,
      title_id: map['title_id'] as String,
      test_subject_id: map['test_subject_id'] as String,
      test_topic_name: map['test_topic_name'] as String,
      created_at: map['created_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelTestTopicModel.fromJson(String source) =>
      ModelTestTopicModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      title_id,
      test_subject_id,
      test_topic_name,
      created_at,
    ];
  }

  factory ModelTestTopicModel.init() => const ModelTestTopicModel(
        id: 0,
        title_id: '',
        test_subject_id: '',
        test_topic_name: '',
        created_at: '',
      );
}
