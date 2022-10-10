// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_api/clean_api.dart';
import 'package:equatable/equatable.dart';

import 'package:nahid_24/domain/app/quiz/quiz_subject_model.dart';

class QuizSubjectState extends Equatable {
  final bool loading;
  final CleanFailure failure;
  final List<QuizSubjectModel> quizSubjects;

  QuizSubjectState({
    required this.loading,
    required this.failure,
    required this.quizSubjects,
  });

  @override
  List<Object> get props {
    return [
      loading,
      failure,
      quizSubjects,
    ];
  }

  QuizSubjectState copyWith({
    bool? loading,
    CleanFailure? failure,
    List<QuizSubjectModel>? quizSubjects,
  }) {
    return QuizSubjectState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      quizSubjects: quizSubjects ?? this.quizSubjects,
    );
  }

  @override
  bool get stringify => true;

  factory QuizSubjectState.init() => QuizSubjectState(
        loading: false,
        failure: CleanFailure.none(),
        quizSubjects: [],
      );

  @override
  String toString() {
    return 'QuizState(loading: $loading, failure: $failure, quizSubjects: $quizSubjects)';
  }
}
