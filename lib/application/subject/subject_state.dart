// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_api/clean_api.dart';
import 'package:nahid_24/domain/course/subject_model.dart';
import 'package:equatable/equatable.dart';

class SubjectState extends Equatable {
  final CleanFailure failure;
  final String className;
  final bool loading;
  final List<SubjectModel> subjects;
  SubjectState({
    required this.failure,
    required this.loading,
    required this.subjects,
    required this.className,
  });

  @override
  List<Object> get props => [failure, loading, subjects];

  @override
  bool get stringify => true;

  SubjectState copyWith({
    CleanFailure? failure,
    bool? loading,
    String? className,
    List<SubjectModel>? hscCourse,
  }) {
    return SubjectState(
        failure: failure ?? this.failure,
        loading: loading ?? this.loading,
        subjects: hscCourse ?? this.subjects,
        className: className ?? this.className);
  }

  factory SubjectState.init() => SubjectState(
      failure: CleanFailure.none(),
      loading: false,
      subjects: [],
      className: '');
}
