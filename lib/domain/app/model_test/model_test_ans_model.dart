// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:nahid_24/domain/app/model_test/model_test_info_model.dart';

class ModelTestAnsModel extends Equatable {
  final int title_id;
  final int test_subject_id;
  final int test_topic_id;
  final List<ModelTestInfoModel> exam_info;
  const ModelTestAnsModel({
    required this.title_id,
    required this.test_subject_id,
    required this.test_topic_id,
    required this.exam_info,
  });

  ModelTestAnsModel copyWith({
    int? title_id,
    int? test_subject_id,
    int? test_topic_id,
    List<ModelTestInfoModel>? exam_info,
  }) {
    return ModelTestAnsModel(
      title_id: title_id ?? this.title_id,
      test_subject_id: test_subject_id ?? this.test_subject_id,
      test_topic_id: test_topic_id ?? this.test_topic_id,
      exam_info: exam_info ?? this.exam_info,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title_id': title_id,
      'test_subject_id': test_subject_id,
      'test_topic_id': test_topic_id,
      'exam_info': exam_info.map((x) => x.toMap()).toList(),
    };
  }

  factory ModelTestAnsModel.fromMap(Map<String, dynamic> map) {
    return ModelTestAnsModel(
      title_id: map['title_id'] as int,
      test_subject_id: map['test_subject_id'] as int,
      test_topic_id: map['test_topic_id'] as int,
      exam_info: List<ModelTestInfoModel>.from(
        (map['exam_info'] as List<int>).map<ModelTestInfoModel>(
          (x) => ModelTestInfoModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelTestAnsModel.fromJson(String source) =>
      ModelTestAnsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props =>
      [title_id, test_subject_id, test_topic_id, exam_info];

  factory ModelTestAnsModel.init() => ModelTestAnsModel(
        title_id: 0,
        test_subject_id: 0,
        test_topic_id: 0,
        exam_info: [],
      );
}
