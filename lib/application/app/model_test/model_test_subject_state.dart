// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_api/clean_api.dart';
import 'package:equatable/equatable.dart';
import 'package:nahid_24/domain/app/model_test/model_test_model.dart';

class ModelTestSubjectState extends Equatable {
  final bool loading;
  final CleanFailure failure;
  final List<ModelTestModel> modelTests;
  ModelTestSubjectState({
    required this.loading,
    required this.failure,
    required this.modelTests,
  });

  ModelTestSubjectState copyWith({
    bool? loading,
    CleanFailure? failure,
    List<ModelTestModel>? modelTests,
  }) {
    return ModelTestSubjectState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      modelTests: modelTests ?? this.modelTests,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [loading, failure, modelTests];

  factory ModelTestSubjectState.init() => ModelTestSubjectState(
      loading: false, failure: CleanFailure.none(), modelTests: []);
}
