import 'package:clean_api/clean_api.dart';
import 'package:nahid_24/domain/course/i_course_repo.dart';
import 'package:nahid_24/infrastucture/course/course_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'subject_state.dart';

final subjectProvider =
    StateNotifierProvider<SubjectNotifier, SubjectState>((ref) {
  return SubjectNotifier(CourseRepo());
});

class SubjectNotifier extends StateNotifier<SubjectState> {
  final ICourseRepo courseRepo;
  SubjectNotifier(this.courseRepo) : super(SubjectState.init());

  getSubjectsList({required String className}) async {
    if (className != state.className) {
      state = state.copyWith(loading: true, className: className);
      final data = await courseRepo.getSubjectsList(className);
      state = data.fold(
          (l) => state.copyWith(loading: false, failure: l),
          (r) => state.copyWith(
              loading: false, hscCourse: r, failure: CleanFailure.none()));
    }
  }

  int select2ndrow = 0;

  change2ndrow(int value) {
    select2ndrow = value;
  }
}
