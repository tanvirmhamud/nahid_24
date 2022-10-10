// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ModelTestMcqModel extends Equatable {
  final int id;
  final String subject_id;
  final String topic_id;
  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final String correct_ans;
  const ModelTestMcqModel({
    required this.id,
    required this.subject_id,
    required this.topic_id,
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.correct_ans,
  });

  ModelTestMcqModel copyWith({
    int? id,
    String? subject_id,
    String? topic_id,
    String? question,
    String? option1,
    String? option2,
    String? option3,
    String? option4,
    String? correct_ans,
  }) {
    return ModelTestMcqModel(
      id: id ?? this.id,
      subject_id: subject_id ?? this.subject_id,
      topic_id: topic_id ?? this.topic_id,
      question: question ?? this.question,
      option1: option1 ?? this.option1,
      option2: option2 ?? this.option2,
      option3: option3 ?? this.option3,
      option4: option4 ?? this.option4,
      correct_ans: correct_ans ?? this.correct_ans,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'subject_id': subject_id,
      'topic_id': topic_id,
      'question': question,
      'option1': option1,
      'option2': option2,
      'option3': option3,
      'option4': option4,
      'correct_ans': correct_ans,
    };
  }

  factory ModelTestMcqModel.fromMap(Map<String, dynamic> map) {
    return ModelTestMcqModel(
      id: map['id'] as int,
      subject_id: map['subject_id'] as String,
      topic_id: map['topic_id'] as String,
      question: map['question'] as String,
      option1: map['option1'] as String,
      option2: map['option2'] as String,
      option3: map['option3'] as String,
      option4: map['option4'] as String,
      correct_ans: map['correct_ans'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelTestMcqModel.fromJson(String source) =>
      ModelTestMcqModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      subject_id,
      topic_id,
      question,
      option1,
      option2,
      option3,
      option4,
      correct_ans,
    ];
  }

  factory ModelTestMcqModel.init() => const ModelTestMcqModel(
      id: 0,
      subject_id: '',
      topic_id: '',
      question: '',
      option1: '',
      option2: '',
      option3: '',
      option4: '',
      correct_ans: '');
}
