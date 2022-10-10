// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_api/clean_api.dart';
import 'package:equatable/equatable.dart';

import 'package:nahid_24/domain/app/model_test/model_test_mcq_model.dart';
import 'package:nahid_24/domain/app/model_test/model_test_result_model.dart';
import 'package:nahid_24/domain/app/model_test/model_test_topic/model_test_topic_model.dart';

class ModelTestState extends Equatable {
  final bool loading;
  final CleanFailure failure;

  final List<ModelTestTopicModel> modelTopics;
  final List<ModelTestMcqModel> modelMcqs;
  final List<ModelTestResultModel> modeltestResult;
  ModelTestState({
    required this.loading,
    required this.failure,
    required this.modelTopics,
    required this.modelMcqs,
    required this.modeltestResult,
  });

  @override
  List<Object> get props {
    return [
      loading,
      failure,
      modelTopics,
      modelMcqs,
      modeltestResult,
    ];
  }

  @override
  bool get stringify => true;

  factory ModelTestState.init() => ModelTestState(
        loading: false,
        failure: CleanFailure.none(),
        modelTopics: [],
        modelMcqs: [],
        modeltestResult: [],
      );

  ModelTestState copyWith({
    bool? loading,
    CleanFailure? failure,
    List<ModelTestTopicModel>? modelTopics,
    List<ModelTestMcqModel>? modelMcqs,
    List<ModelTestResultModel>? modeltestResult,
  }) {
    return ModelTestState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      modelTopics: modelTopics ?? this.modelTopics,
      modelMcqs: modelMcqs ?? this.modelMcqs,
      modeltestResult: modeltestResult ?? this.modeltestResult,
    );
  }
}
