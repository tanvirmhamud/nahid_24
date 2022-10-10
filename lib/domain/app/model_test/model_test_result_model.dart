// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ModelTestResultModel extends Equatable {
  final int id;
  final String user_id;
  final String title_id;
  final String test_subject_id;
  final String test_topic_id;
  final String total_correct;
  final String exam_info;
  const ModelTestResultModel({
    required this.id,
    required this.user_id,
    required this.title_id,
    required this.test_subject_id,
    required this.test_topic_id,
    required this.total_correct,
    required this.exam_info,
  });

  ModelTestResultModel copyWith({
    int? id,
    String? user_id,
    String? title_id,
    String? test_subject_id,
    String? test_topic_id,
    String? total_correct,
    String? exam_info,
  }) {
    return ModelTestResultModel(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      title_id: title_id ?? this.title_id,
      test_subject_id: test_subject_id ?? this.test_subject_id,
      test_topic_id: test_topic_id ?? this.test_topic_id,
      total_correct: total_correct ?? this.total_correct,
      exam_info: exam_info ?? this.exam_info,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': user_id,
      'title_id': title_id,
      'test_subject_id': test_subject_id,
      'test_topic_id': test_topic_id,
      'total_correct': total_correct,
      'exam_info': exam_info,
    };
  }

  factory ModelTestResultModel.fromMap(Map<String, dynamic> map) {
    return ModelTestResultModel(
      id: map['id'] as int,
      user_id: map['user_id'] as String,
      title_id: map['title_id'] as String,
      test_subject_id: map['test_subject_id'] as String,
      test_topic_id: map['test_topic_id'] as String,
      total_correct: map['total_correct'] as String,
      exam_info: map['exam_info'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelTestResultModel.fromJson(String source) =>
      ModelTestResultModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      user_id,
      title_id,
      test_subject_id,
      test_topic_id,
      total_correct,
      exam_info,
    ];
  }

  factory ModelTestResultModel.init() => const ModelTestResultModel(
      id: 0,
      user_id: '',
      title_id: '',
      test_subject_id: '',
      test_topic_id: '',
      total_correct: '',
      exam_info: '');
}
