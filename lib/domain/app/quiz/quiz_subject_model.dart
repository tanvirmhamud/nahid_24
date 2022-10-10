// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:nahid_24/domain/app/quiz/quiz_subject.dart';

class QuizSubjectModel extends Equatable {
  final String title;
  final List<QuizSubject> subjects;
  const QuizSubjectModel({
    required this.title,
    required this.subjects,
  });

  QuizSubjectModel copyWith({
    String? title,
    List<QuizSubject>? subjects,
  }) {
    return QuizSubjectModel(
      title: title ?? this.title,
      subjects: subjects ?? this.subjects,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'subjects': subjects.map((x) => x.toMap()).toList(),
    };
  }

  factory QuizSubjectModel.fromMap(Map<String, dynamic> map) {
    return QuizSubjectModel(
      title: map['title'] as String,
      subjects: List<QuizSubject>.from(
        (map['subjects'] as List<dynamic>).map<QuizSubject>(
          (x) => QuizSubject.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizSubjectModel.fromJson(String source) =>
      QuizSubjectModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [title, subjects];

  factory QuizSubjectModel.init() =>
      const QuizSubjectModel(title: '', subjects: []);
}
