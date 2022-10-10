import 'package:clean_api/clean_api.dart';
import 'package:nahid_24/application/course/course_provider.dart';
import 'package:nahid_24/domain/course/course_model.dart';

import 'subject_model.dart';

abstract class ICourseRepo {
  Future<Either<CleanFailure, List<CourseModel>>> getCourseList(
      Subject subject);
  Future<Either<CleanFailure, List<SubjectModel>>> getSubjectsList(
      String className);
}
