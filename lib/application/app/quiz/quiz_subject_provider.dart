import 'package:clean_api/clean_api.dart';
import 'package:nahid_24/application/app/quiz/quiz_subject_state.dart';
import 'package:nahid_24/domain/app/quiz/i_quiz_repo.dart';
import 'package:nahid_24/infrastucture/app/quiz/quiz_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final quizSubjectProvider =
    StateNotifierProvider<QuizSubjectNotifier, QuizSubjectState>((ref) {
  return QuizSubjectNotifier(QuizRepo());
});

class QuizSubjectNotifier extends StateNotifier<QuizSubjectState> {
  final IQuizRepo quizRepo;
  QuizSubjectNotifier(this.quizRepo) : super(QuizSubjectState.init());

  getAllQuizSubject() async {
    if (state.quizSubjects.isEmpty) {
      state = state.copyWith(loading: true);
      final data = await quizRepo.getAllQuizSubject();
      state = data.fold(
        (l) => state.copyWith(loading: false, failure: l),
        (r) => state.copyWith(
          loading: false,
          failure: CleanFailure.none(),
          quizSubjects: r,
        ),
      );
    }
  }
}
