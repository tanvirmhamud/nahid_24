import 'package:clean_api/clean_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nahid_24/application/app/model_test/model_test_subject_state.dart';
import 'package:nahid_24/domain/app/model_test/i_model_test_repo.dart';
import 'package:nahid_24/infrastucture/app/model_test/model_test_repo.dart';

final modelTestSubjectProvider =
    StateNotifierProvider<ModelTestSubjectNotifier, ModelTestSubjectState>(
        (ref) {
  return ModelTestSubjectNotifier(ModelTestRepo());
});

class ModelTestSubjectNotifier extends StateNotifier<ModelTestSubjectState> {
  final IModelTestRepo modelTestRepo;
  ModelTestSubjectNotifier(this.modelTestRepo)
      : super(ModelTestSubjectState.init());

  getAllModelTests() async {
    state = state.copyWith(loading: true);
    final data = await modelTestRepo.getAllModelTest();
    state = data.fold(
      (l) => state.copyWith(loading: false, failure: l),
      (r) => state.copyWith(
        loading: false,
        failure: CleanFailure.none(),
        modelTests: r,
      ),
    );
  }
}
