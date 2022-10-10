import 'package:clean_api/clean_api.dart';
import 'package:nahid_24/domain/app/model_test/i_model_test_repo.dart';
import 'package:nahid_24/domain/app/model_test/model_test_ans_model.dart';
import 'package:nahid_24/domain/app/model_test/model_test_mcq_model.dart';
import 'package:nahid_24/domain/app/model_test/model_test_model.dart';
import 'package:nahid_24/domain/app/model_test/model_test_result_model.dart';
import 'package:nahid_24/domain/app/model_test/model_test_topic/model_test_topic_model.dart';

class ModelTestRepo extends IModelTestRepo {
  final cleanApi = CleanApi.instance;
  @override
  Future<Either<CleanFailure, List<ModelTestModel>>> getAllModelTest() async {
    return cleanApi.get(
        fromData: ((json) => List<ModelTestModel>.from(
            json.map((e) => ModelTestModel.fromMap(e)))),
        endPoint: 'Model_Test');
  }

  @override
  Future<Either<CleanFailure, List<ModelTestTopicModel>>> getAllModelTestTopic(
      {required String id}) async {
    return cleanApi.get(
        fromData: ((json) => List<ModelTestTopicModel>.from(
            json["data"].map((e) => ModelTestTopicModel.fromMap(e)))),
        endPoint: 'Model_Test/$id');
  }

  @override
  Future<Either<CleanFailure, List<ModelTestMcqModel>>> getAllModelTestMcqs(
      {required String id}) async {
    return cleanApi.get(
        fromData: ((json) => List<ModelTestMcqModel>.from(
            json["data"].map((e) => ModelTestMcqModel.fromMap(e)))),
        endPoint: 'Exam_Mcq/$id');
  }

  @override
  Future<Either<CleanFailure, Unit>> submitModelTestAnswer(
      {required ModelTestAnsModel ans}) async {
    return cleanApi.post(
        fromData: (json) => unit,
        body: ans.toMap(),
        endPoint: 'Take_Model_Test');
  }

  @override
  Future<Either<CleanFailure, List<ModelTestResultModel>>>
      myModelTestResults() async {
    return await cleanApi.get(
        fromData: ((json) => List<ModelTestResultModel>.from(
            json.map((e) => ModelTestResultModel.fromMap(e)))),
        endPoint: 'My_Model_Test_Result');
  }
}
