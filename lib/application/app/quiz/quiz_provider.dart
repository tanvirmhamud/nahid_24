import 'package:clean_api/clean_api.dart';
import 'package:nahid_24/domain/app/quiz/i_quiz_repo.dart';
import 'package:nahid_24/domain/app/quiz/submit_quiz_model.dart';
import 'package:nahid_24/infrastucture/app/quiz/quiz_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'quiz_state.dart';

final quizProvider =
    StateNotifierProvider.family<QuizSubjectNotifier, QuizState, int>(
        (ref, subjectId) {
  return QuizSubjectNotifier(QuizRepo(), subjectId);
});

class QuizSubjectNotifier extends StateNotifier<QuizState> {
  final int subjectId;
  final IQuizRepo quizRepo;
  QuizSubjectNotifier(this.quizRepo, this.subjectId) : super(QuizState.init());

  getAllQuizList() async {
    state = state.copyWith(loading: true);
    final data = await quizRepo.getAllQuizList(id: subjectId);
    state = data.fold(
      (l) => state.copyWith(loading: false, failure: l),
      (r) => state.copyWith(
        loading: false,
        failure: CleanFailure.none(),
        quizList: r,
      ),
    );
  }

  submitQuiz(SubmitQuizModel quizModel) async {
    state = state.copyWith(loading: true);
    final data = await quizRepo.submitQuiz(quizModel: quizModel);
    state = data.fold(
      (l) => state.copyWith(loading: false, failure: l),
      (r) => state.copyWith(
        loading: false,
        failure: CleanFailure.none(),
      ),
    );
  }

  getQuizResult() async {
    state = state.copyWith(loading: true);
    final data = await quizRepo.getMyQuizResult();
    state = data.fold(
      (l) => state.copyWith(loading: false, failure: l),
      (r) => state.copyWith(
        loading: false,
        failure: CleanFailure.none(),
        quizResult: r,
      ),
    );
  }
}
