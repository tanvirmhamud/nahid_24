import 'package:clean_api/clean_api.dart';
import 'package:nahid_24/application/course/course_provider.dart';
import 'package:nahid_24/domain/course/course_model.dart';
import 'package:nahid_24/domain/course/i_course_repo.dart';
import 'package:nahid_24/domain/course/subject_model.dart';

class CourseRepo extends ICourseRepo {
  final cleanApi = CleanApi.instance;

  @override
  Future<Either<CleanFailure, List<CourseModel>>> getCourseList(
      Subject subject) async {
    final course = subject.courseName.replaceAll('_Subject', '');
    return await cleanApi.get(
        fromData: ((json) => List<CourseModel>.from(
            json['data'].map((e) => CourseModel.fromMap(e)))),
        endPoint: '${course}/${subject.subject.subjectName}');
  }

  @override
  Future<Either<CleanFailure, List<SubjectModel>>> getSubjectsList(
      String className) async {
    return await cleanApi.get(
        fromData: ((json) => List<SubjectModel>.from(
            json['data'].map((e) => SubjectModel.fromMap(e)))),
        endPoint: '$className');
  }
}
