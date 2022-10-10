// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class QuizSubject extends Equatable {
  final int id;
  final String quizSubjectId;
  final String topicName;
  const QuizSubject({
    required this.id,
    required this.quizSubjectId,
    required this.topicName,
  });

  QuizSubject copyWith({
    int? id,
    String? quizSubjectId,
    String? topicName,
  }) {
    return QuizSubject(
      id: id ?? this.id,
      quizSubjectId: quizSubjectId ?? this.quizSubjectId,
      topicName: topicName ?? this.topicName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quiz_subject_id': quizSubjectId,
      'topic_name': topicName,
    };
  }

  factory QuizSubject.fromMap(Map<String, dynamic> map) {
    return QuizSubject(
      id: map['id']?.toInt() ?? 0,
      quizSubjectId: map['quiz_subject_id'] ?? '',
      topicName: map['topic_name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizSubject.fromJson(String source) =>
      QuizSubject.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, quizSubjectId, topicName];

  factory QuizSubject.init() =>
      const QuizSubject(id: 0, quizSubjectId: '', topicName: '');

  @override
  String toString() =>
      'QuizSubject(id: $id, quizSubjectId: $quizSubjectId, topicName: $topicName)';
}
