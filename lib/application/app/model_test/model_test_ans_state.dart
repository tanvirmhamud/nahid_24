// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_api/clean_api.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:nahid_24/domain/app/model_test/model_test_info_model.dart';

class ModelTestAnsState extends Equatable {
  final bool loading;
  final CleanFailure failure;
  final IList<ModelTestInfoModel> answers;
  ModelTestAnsState({
    required this.loading,
    required this.failure,
    required this.answers,
  });

  @override
  List<Object> get props => [loading, failure, answers];

  ModelTestAnsState copyWith({
    bool? loading,
    CleanFailure? failure,
    IList<ModelTestInfoModel>? answers,
  }) {
    return ModelTestAnsState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      answers: answers ?? this.answers,
    );
  }

  @override
  bool get stringify => true;

  factory ModelTestAnsState.init() => ModelTestAnsState(
        loading: false,
        failure: CleanFailure.none(),
        answers: const IListConst([]),
      );
}
