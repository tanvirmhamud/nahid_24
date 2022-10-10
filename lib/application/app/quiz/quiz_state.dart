// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_api/clean_api.dart';
import 'package:equatable/equatable.dart';

import 'package:nahid_24/domain/app/quiz/quiz_model.dart';
import 'package:nahid_24/domain/app/quiz/quiz_result_model.dart';

class QuizState extends Equatable {
  final bool loading;
  final CleanFailure failure;
  final List<QuizModel> quizList;
  final List<QuizResultModel> quizResult;
  QuizState({
    required this.loading,
    required this.failure,
    required this.quizList,
    required this.quizResult,
  });

  @override
  List<Object> get props {
    return [
      loading,
      failure,
      quizList,
      quizResult,
    ];
  }

  QuizState copyWith({
    bool? loading,
    CleanFailure? failure,
    List<QuizModel>? quizList,
    List<QuizResultModel>? quizResult,
  }) {
    return QuizState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      quizList: quizList ?? this.quizList,
      quizResult: quizResult ?? this.quizResult,
    );
  }

  @override
  bool get stringify => true;

  factory QuizState.init() => QuizState(
        loading: false,
        failure: CleanFailure.none(),
        quizList: [],
        quizResult: [],
      );

  @override
  String toString() {
    return 'QuizState(loading: $loading, failure: $failure, quizList: $quizList, quizResult: $quizResult)';
  }
}
