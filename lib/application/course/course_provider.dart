import 'package:clean_api/clean_api.dart';
import 'package:nahid_24/domain/course/subject_model.dart';
import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:nahid_24/application/course/course_state.dart';
import 'package:nahid_24/domain/course/i_course_repo.dart';
import 'package:nahid_24/infrastucture/course/course_repo.dart';

class Subject extends Equatable {
  final String courseName;
  final SubjectModel subject;
  Subject({
    required this.courseName,
    required this.subject,
  });

  @override
  List<Object> get props => [courseName, subject];
}

final courseProvider =
    StateNotifierProvider.family<CourseNotifier, CourseState, Subject>(
        (ref, subject) {
  return CourseNotifier(CourseRepo(), subject);
});

class CourseNotifier extends StateNotifier<CourseState> {
  final Subject subject;
  final ICourseRepo courseRepo;
  CourseNotifier(this.courseRepo, this.subject) : super(CourseState.init());

  getCourseList() async {
    state = state.copyWith(loading: true);
    final data = await courseRepo.getCourseList(subject);
    state = data.fold(
        (l) => state.copyWith(loading: false, failure: l),
        (r) => state.copyWith(
            loading: false, hscCourse: r, failure: CleanFailure.none()));
  }
}
