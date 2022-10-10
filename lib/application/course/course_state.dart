// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_api/clean_api.dart';
import 'package:equatable/equatable.dart';

import 'package:nahid_24/domain/course/course_model.dart';

class CourseState extends Equatable {
  final CleanFailure failure;
  final bool loading;
  final List<CourseModel> courses;
  CourseState({
    required this.failure,
    required this.loading,
    required this.courses,
  });

  @override
  List<Object> get props => [failure, loading, courses];

  @override
  bool get stringify => true;

  CourseState copyWith({
    CleanFailure? failure,
    bool? loading,
    String? className,
    List<CourseModel>? hscCourse,
  }) {
    return CourseState(
      failure: failure ?? this.failure,
      loading: loading ?? this.loading,
      courses: hscCourse ?? this.courses,
    );
  }

  factory CourseState.init() => CourseState(
        failure: CleanFailure.none(),
        loading: false,
        courses: [],
      );
}
