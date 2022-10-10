// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:nahid_24/domain/app/model_test/model_test_subject_model.dart';

class ModelTestModel extends Equatable {
  final String title;
  final List<ModelTestSubjectModel> subjects;
  const ModelTestModel({
    required this.title,
    required this.subjects,
  });

  ModelTestModel copyWith({
    String? title,
    List<ModelTestSubjectModel>? subjects,
  }) {
    return ModelTestModel(
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

  factory ModelTestModel.fromMap(Map<String, dynamic> map) {
    return ModelTestModel(
      title: map['title'] as String,
      subjects: List<ModelTestSubjectModel>.from(
        (map['subjects'] as List<dynamic>).map<ModelTestSubjectModel>(
          (x) => ModelTestSubjectModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelTestModel.fromJson(String source) =>
      ModelTestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [title, subjects];

  factory ModelTestModel.init() => ModelTestModel(title: '', subjects: []);
}
