import 'package:nahid_24/constant.dart';

import '../../Model/lavel_scorebord.dart';
import 'package:http/http.dart' as http;

class Httpscorebord {
  Future<List<LavelScoreboard>?> quizescorebord(
      {quiz_topics_id, quiz_subject_id}) async {
    var request = http.Request('GET',
        Uri.parse('$baseurl/api/quiz_top/$quiz_topics_id/$quiz_subject_id'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return lavelScoreboardFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<List<LavelScoreboard>?> modelscorebord(
      {titleid, test_subject_id, test_topic_id}) async {
    print(titleid);
    print(test_subject_id);
    print(test_topic_id);
    var request = http.Request(
        'GET',
        Uri.parse(
            '$baseurl/api/model_test_top/$titleid/$test_subject_id/$test_topic_id'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);
    print(responsedata.body);
    if (response.statusCode == 200) {
      return lavelScoreboardFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<List<LavelScoreboard>?> examscorebord({topicid, subjectid}) async {
    var request = http.Request(
        'GET', Uri.parse('$baseurl/api/exam_top/$topicid/$subjectid'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return lavelScoreboardFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }
}
