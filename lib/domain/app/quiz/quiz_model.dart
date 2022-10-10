// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class QuizModel extends Equatable {
  final int id;
  final String quizSubjectId;
  final String quizTopicsId;
  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final String correctAns;
  const QuizModel({
    required this.id,
    required this.quizSubjectId,
    required this.quizTopicsId,
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.correctAns,
  });

  QuizModel copyWith({
    int? id,
    String? quizSubjectId,
    String? quizTopicsId,
    String? question,
    String? option1,
    String? option2,
    String? option3,
    String? option4,
    String? correctAns,
  }) {
    return QuizModel(
      id: id ?? this.id,
      quizSubjectId: quizSubjectId ?? this.quizSubjectId,
      quizTopicsId: quizTopicsId ?? this.quizTopicsId,
      question: question ?? this.question,
      option1: option1 ?? this.option1,
      option2: option2 ?? this.option2,
      option3: option3 ?? this.option3,
      option4: option4 ?? this.option4,
      correctAns: correctAns ?? this.correctAns,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quiz_subject_id': quizSubjectId,
      'quiz_topics_id': quizTopicsId,
      'question': question,
      'option1': option1,
      'option2': option2,
      'option3': option3,
      'option4': option4,
      'correct_ans': correctAns,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      id: map['id']?.toInt() ?? 0,
      quizSubjectId: map['quiz_subject_id'] ?? '',
      quizTopicsId: map['quiz_topics_id'] ?? '',
      question: map['question'] ?? '',
      option1: map['option1'] ?? '',
      option2: map['option2'] ?? '',
      option3: map['option3'] ?? '',
      option4: map['option4'] ?? '',
      correctAns: map['correct_ans'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      quizSubjectId,
      quizTopicsId,
      question,
      option1,
      option2,
      option3,
      option4,
      correctAns,
    ];
  }

  factory QuizModel.init() => const QuizModel(
      id: 0,
      quizSubjectId: '',
      quizTopicsId: '',
      question: '',
      option1: '',
      option2: '',
      option3: '',
      option4: '',
      correctAns: '');

  @override
  String toString() {
    return 'QuizModel(id: $id, quizSubjectId: $quizSubjectId, quizTopicsId: $quizTopicsId, question: $question, option1: $option1, option2: $option2, option3: $option3, option4: $option4, correctAns: $correctAns)';
  }
}
