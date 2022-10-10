import 'package:clean_api/clean_api.dart';
import 'package:nahid_24/application/app/model_test/model_test_state.dart';
import 'package:nahid_24/domain/app/model_test/i_model_test_repo.dart';
import 'package:nahid_24/domain/app/model_test/model_test_ans_model.dart';
import 'package:nahid_24/infrastucture/app/model_test/model_test_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final modelTestProvider =
    StateNotifierProvider.family<ModelTestNotifier, ModelTestState, int>(
        (ref, id) {
  return ModelTestNotifier(ModelTestRepo(), id);
});

class ModelTestNotifier extends StateNotifier<ModelTestState> {
  final int id;

  final IModelTestRepo modelTestRepo;
  ModelTestNotifier(this.modelTestRepo, this.id) : super(ModelTestState.init());

  getAllModelTestTopic() async {
    state = state.copyWith(loading: true);
    final data = await modelTestRepo.getAllModelTestTopic(id: id.toString());
    state = data.fold(
      (l) => state.copyWith(loading: false, failure: l),
      (r) => state.copyWith(
        loading: false,
        failure: CleanFailure.none(),
        modelTopics: r,
      ),
    );
  }

  getAllModelTestMcqs() async {
    state = state.copyWith(loading: true);
    final data = await modelTestRepo.getAllModelTestMcqs(id: id.toString());
    state = data.fold(
      (l) => state.copyWith(loading: false, failure: l),
      (r) => state.copyWith(
        loading: false,
        failure: CleanFailure.none(),
        modelMcqs: r,
      ),
    );
  }

  submitModelTestAnswer(ModelTestAnsModel ans) async {
    state = state.copyWith(loading: true);
    final data = await modelTestRepo.submitModelTestAnswer(ans: ans);
    state = data.fold(
      (l) => state.copyWith(loading: false, failure: l),
      (r) => state.copyWith(
        loading: false,
        failure: CleanFailure.none(),
      ),
    );
  }

  myModelTestResults() async {
    state = state.copyWith(loading: true);
    final data = await modelTestRepo.myModelTestResults();
    state = data.fold(
      (l) => state.copyWith(loading: false, failure: l),
      (r) => state.copyWith(
        loading: false,
        failure: CleanFailure.none(),
        modeltestResult: r,
      ),
    );
  }
}
