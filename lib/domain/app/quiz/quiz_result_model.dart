// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class QuizResultModel extends Equatable {
  final int id;
  final String user_id;
  final String quiz_topics_id;
  final String quiz_subject_id;
  final String total_correct;
  final String exam_info;
  const QuizResultModel({
    required this.id,
    required this.user_id,
    required this.quiz_topics_id,
    required this.quiz_subject_id,
    required this.total_correct,
    required this.exam_info,
  });

  QuizResultModel copyWith({
    int? id,
    String? user_id,
    String? quiz_topics_id,
    String? quiz_subject_id,
    String? total_correct,
    String? exam_info,
  }) {
    return QuizResultModel(
      id: id ?? this.id,
      user_id: user_id ?? this.user_id,
      quiz_topics_id: quiz_topics_id ?? this.quiz_topics_id,
      quiz_subject_id: quiz_subject_id ?? this.quiz_subject_id,
      total_correct: total_correct ?? this.total_correct,
      exam_info: exam_info ?? this.exam_info,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': user_id,
      'quiz_topics_id': quiz_topics_id,
      'quiz_subject_id': quiz_subject_id,
      'total_correct': total_correct,
      'exam_info': exam_info,
    };
  }

  factory QuizResultModel.fromMap(Map<String, dynamic> map) {
    return QuizResultModel(
      id: map['id'] as int,
      user_id: map['user_id'] as String,
      quiz_topics_id: map['quiz_topics_id'] as String,
      quiz_subject_id: map['quiz_subject_id'] as String,
      total_correct: map['total_correct'] as String,
      exam_info: map['exam_info'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizResultModel.fromJson(String source) =>
      QuizResultModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      user_id,
      quiz_topics_id,
      quiz_subject_id,
      total_correct,
      exam_info,
    ];
  }

  factory QuizResultModel.init() => QuizResultModel(
      id: 0,
      user_id: '',
      quiz_topics_id: '',
      quiz_subject_id: '',
      total_correct: '',
      exam_info: '');
}
