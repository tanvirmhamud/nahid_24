// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:nahid_24/domain/app/quiz/submit_quiz_info.dart';

class SubmitQuizModel extends Equatable {
  final int quiz_topics_id;
  final int quiz_subject_id;
  final List<SubmitQuizInfo> exam_info;
  const SubmitQuizModel({
    required this.quiz_topics_id,
    required this.quiz_subject_id,
    required this.exam_info,
  });

  SubmitQuizModel copyWith({
    int? quiz_topics_id,
    int? quiz_subject_id,
    List<SubmitQuizInfo>? exam_info,
  }) {
    return SubmitQuizModel(
      quiz_topics_id: quiz_topics_id ?? this.quiz_topics_id,
      quiz_subject_id: quiz_subject_id ?? this.quiz_subject_id,
      exam_info: exam_info ?? this.exam_info,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quiz_topics_id': quiz_topics_id,
      'quiz_subject_id': quiz_subject_id,
      'exam_info': exam_info.map((x) => x.toMap()).toList(),
    };
  }

  factory SubmitQuizModel.fromMap(Map<String, dynamic> map) {
    return SubmitQuizModel(
      quiz_topics_id: map['quiz_topics_id'] as int,
      quiz_subject_id: map['quiz_subject_id'] as int,
      exam_info: List<SubmitQuizInfo>.from(
        (map['exam_info'] as List<int>).map<SubmitQuizInfo>(
          (x) => SubmitQuizInfo.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SubmitQuizModel.fromJson(String source) =>
      SubmitQuizModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [quiz_topics_id, quiz_subject_id, exam_info];

  factory SubmitQuizModel.init() => const SubmitQuizModel(
      quiz_topics_id: 0, quiz_subject_id: 0, exam_info: []);
}
