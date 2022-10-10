// To parse this JSON data, do
//
//     final examTopic = examTopicFromJson(jsonString);

import 'dart:convert';

ExamTopic examTopicFromJson(String str) => ExamTopic.fromJson(json.decode(str));

String examTopicToJson(ExamTopic data) => json.encode(data.toJson());

class ExamTopic {
    ExamTopic({
        this.error,
        this.data,
    });

    bool? error;
    List<Datum>? data;

    factory ExamTopic.fromJson(Map<String, dynamic> json) => ExamTopic(
        error: json["error"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.subjectId,
        this.topicName,
       
    });

    int? id;
    String? subjectId;
    String? topicName;
   

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        subjectId: json["subject_id"],
        topicName: json["topic_name"],
       
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "subject_id": subjectId,
        "topic_name": topicName,
      
    };
}
