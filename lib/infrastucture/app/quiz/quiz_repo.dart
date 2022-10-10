import 'package:clean_api/clean_api.dart';
import 'package:nahid_24/domain/app/quiz/i_quiz_repo.dart';
import 'package:nahid_24/domain/app/quiz/quiz_model.dart';
import 'package:nahid_24/domain/app/quiz/quiz_result_model.dart';
import 'package:nahid_24/domain/app/quiz/quiz_subject_model.dart';
import 'package:nahid_24/domain/app/quiz/submit_quiz_model.dart';

class QuizRepo extends IQuizRepo {
  final cleanApi = CleanApi.instance;
  @override
  Future<Either<CleanFailure, List<QuizSubjectModel>>>
      getAllQuizSubject() async {
    return await cleanApi.get(
        fromData: ((json) => List<QuizSubjectModel>.from(
            json.map((e) => QuizSubjectModel.fromMap(e)))),
        endPoint: 'quiz_subjects');
  }

  @override
  Future<Either<CleanFailure, List<QuizModel>>> getAllQuizList(
      {required int id}) async {
    return await cleanApi.get(
        fromData: ((json) => List<QuizModel>.from(
            json["data"].map((e) => QuizModel.fromMap(e)))),
        endPoint: 'quiz_subjects/$id');
  }

  @override
  Future<Either<CleanFailure, Unit>> submitQuiz(
      {required SubmitQuizModel quizModel}) async {
    return await cleanApi.post(
        fromData: (json) => unit,
        body: quizModel.toMap(),
        endPoint: 'Take_Quiz');
  }

  @override
  Future<Either<CleanFailure, List<QuizResultModel>>> getMyQuizResult() async {
    return await cleanApi.get(
        fromData: ((json) => List<QuizResultModel>.from(
            json.map((e) => QuizResultModel.fromMap(e)))),
        endPoint: 'My_Quiz_Results');
  }
}
