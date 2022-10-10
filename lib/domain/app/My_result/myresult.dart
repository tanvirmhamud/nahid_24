// To parse this JSON data, do
//
//     final myResult = myResultFromJson(jsonString);

import 'dart:convert';

List<MyResult> myResultFromJson(String str) => List<MyResult>.from(json.decode(str).map((x) => MyResult.fromJson(x)));

String myResultToJson(List<MyResult> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyResult {
    MyResult({
        this.id,
        this.userId,
        this.subjectId,
        this.topicId,
        this.totalCorrect,
        this.examInfo,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? userId;
    String? subjectId;
    String? topicId;
    String? totalCorrect;
    List<ExamInfo>? examInfo;
    DateTime? createdAt;
    dynamic updatedAt;

    factory MyResult.fromJson(Map<String, dynamic> json) => MyResult(
        id: json["id"],
        userId: json["user_id"],
        subjectId: json["subject_id"],
        topicId: json["topic_id"],
        totalCorrect: json["total_correct"],
        examInfo: List<ExamInfo>.from(json["exam_info"].map((x) => ExamInfo.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "subject_id": subjectId,
        "topic_id": topicId,
        "total_correct": totalCorrect,
        "exam_info": List<dynamic>.from(examInfo!.map((x) => x.toJson())),
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt,
    };
}

class ExamInfo {
    ExamInfo({
        this.id,
        this.question,
        this.option1,
        this.option2,
        this.option3,
        this.option4,
        this.rightAns,
        this.submitAns,
    });

    int? id;
    String? question;
    String? option1;
    String? option2;
    String? option3;
    String? option4;
    String? rightAns;
    String? submitAns;

    factory ExamInfo.fromJson(Map<String, dynamic> json) => ExamInfo(
        id: json["id"],
        question: json["question"],
        option1: json["option1"],
        option2: json["option2"],
        option3: json["option3"],
        option4: json["option4"],
        rightAns: json["right_ans"],
        submitAns: json["submit_ans"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "option1": option1,
        "option2": option2,
        "option3": option3,
        "option4": option4,
        "right_ans": rightAns,
        "submit_ans": submitAns,
    };
}
