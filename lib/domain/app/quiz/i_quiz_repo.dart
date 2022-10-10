import 'package:clean_api/clean_api.dart';
import 'package:nahid_24/domain/app/quiz/quiz_model.dart';
import 'package:nahid_24/domain/app/quiz/quiz_result_model.dart';
import 'package:nahid_24/domain/app/quiz/quiz_subject_model.dart';
import 'package:nahid_24/domain/app/quiz/submit_quiz_model.dart';

abstract class IQuizRepo {
  Future<Either<CleanFailure, List<QuizSubjectModel>>> getAllQuizSubject();
  Future<Either<CleanFailure, List<QuizModel>>> getAllQuizList(
      {required int id});
  Future<Either<CleanFailure, Unit>> submitQuiz(
      {required SubmitQuizModel quizModel});
  Future<Either<CleanFailure, List<QuizResultModel>>> getMyQuizResult();
}
