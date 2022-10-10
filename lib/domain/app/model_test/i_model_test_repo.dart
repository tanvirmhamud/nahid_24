import 'package:clean_api/clean_api.dart';
import 'package:nahid_24/domain/app/model_test/model_test_ans_model.dart';
import 'package:nahid_24/domain/app/model_test/model_test_mcq_model.dart';
import 'package:nahid_24/domain/app/model_test/model_test_model.dart';
import 'package:nahid_24/domain/app/model_test/model_test_result_model.dart';
import 'package:nahid_24/domain/app/model_test/model_test_topic/model_test_topic_model.dart';

abstract class IModelTestRepo {
  Future<Either<CleanFailure, List<ModelTestModel>>> getAllModelTest();
  Future<Either<CleanFailure, List<ModelTestTopicModel>>> getAllModelTestTopic(
      {required String id});
  Future<Either<CleanFailure, List<ModelTestMcqModel>>> getAllModelTestMcqs(
      {required String id});
  Future<Either<CleanFailure, Unit>> submitModelTestAnswer(
      {required ModelTestAnsModel ans});
  Future<Either<CleanFailure, List<ModelTestResultModel>>> myModelTestResults();
}
