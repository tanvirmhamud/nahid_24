// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class SubmitQuizInfo extends Equatable {
  final int id;
  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final String right_ans;
  final String submit_ans;
  const SubmitQuizInfo({
    required this.id,
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.right_ans,
    required this.submit_ans,
  });

  SubmitQuizInfo copyWith({
    int? id,
    String? question,
    String? option1,
    String? option2,
    String? option3,
    String? option4,
    String? right_ans,
    String? submit_ans,
  }) {
    return SubmitQuizInfo(
      id: id ?? this.id,
      question: question ?? this.question,
      option1: option1 ?? this.option1,
      option2: option2 ?? this.option2,
      option3: option3 ?? this.option3,
      option4: option4 ?? this.option4,
      right_ans: right_ans ?? this.right_ans,
      submit_ans: submit_ans ?? this.submit_ans,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'question': question,
      'option1': option1,
      'option2': option2,
      'option3': option3,
      'option4': option4,
      'right_ans': right_ans,
      'submit_ans': submit_ans,
    };
  }

  factory SubmitQuizInfo.fromMap(Map<String, dynamic> map) {
    return SubmitQuizInfo(
      id: map['id'] as int,
      question: map['question'] as String,
      option1: map['option1'] as String,
      option2: map['option2'] as String,
      option3: map['option3'] as String,
      option4: map['option4'] as String,
      right_ans: map['right_ans'] as String,
      submit_ans: map['submit_ans'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubmitQuizInfo.fromJson(String source) =>
      SubmitQuizInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      question,
      option1,
      option2,
      option3,
      option4,
      right_ans,
      submit_ans,
    ];
  }

  factory SubmitQuizInfo.init() => const SubmitQuizInfo(
      id: 0,
      question: '',
      option1: '',
      option2: '',
      option3: '',
      option4: '',
      right_ans: '',
      submit_ans: '');
}
