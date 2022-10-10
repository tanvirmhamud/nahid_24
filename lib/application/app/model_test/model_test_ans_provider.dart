import 'package:clean_api/clean_api.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nahid_24/application/app/model_test/model_test_ans_state.dart';
import 'package:nahid_24/domain/app/model_test/i_model_test_repo.dart';
import 'package:nahid_24/domain/app/model_test/model_test_ans_model.dart';
import 'package:nahid_24/infrastucture/app/model_test/model_test_repo.dart';

final modelTestAnswerProvider = StateNotifierProvider.family<
    ModelTestAnsNotifier,
    ModelTestAnsState,
    ModelTestAnsModel>((ref, modelTestAns) {
  return ModelTestAnsNotifier(modelTestAns, ModelTestRepo());
});

class ModelTestAnsNotifier extends StateNotifier<ModelTestAnsState> {
  final ModelTestAnsModel modelTestAns;
  final IModelTestRepo modelTestRepo;
  ModelTestAnsNotifier(this.modelTestAns, this.modelTestRepo)
      : super(ModelTestAnsState.init());

  init() {
    state = state.copyWith(answers: modelTestAns.exam_info.lock);
    Logger.i(state.answers);
  }

  updateAnswer(int index, String ans) {
    Logger.i(state.answers.length);
    final ques = state.answers[index];
    final answer = state.answers.replace(index, ques.copyWith(submit_ans: ans));
    state = state.copyWith(answers: answer);
    Logger.i(state.answers);
  }

  submitModelTestAnswer() async {
    state = state.copyWith(loading: true);
    final ans = modelTestAns.copyWith(exam_info: state.answers.unlock);
    final data = await modelTestRepo.submitModelTestAnswer(ans: ans);
    state = data.fold(
      (l) => state.copyWith(loading: false, failure: l),
      (r) => state.copyWith(
        loading: false,
        failure: CleanFailure.none(),
      ),
    );
  }
}
