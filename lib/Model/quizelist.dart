// To parse this JSON data, do
//
//     final quizeList = quizeListFromJson(jsonString);

import 'dart:convert';

QuizeList quizeListFromJson(String str) => QuizeList.fromJson(json.decode(str));

String quizeListToJson(QuizeList data) => json.encode(data.toJson());

class QuizeList {
    QuizeList({
        this.error,
        this.data,
    });

    bool? error;
    List<Datum>? data;

    factory QuizeList.fromJson(Map<String, dynamic> json) => QuizeList(
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
        this.quizSubjectId,
        this.quizTopicsId,
        this.question,
        this.option1,
        this.option2,
        this.option3,
        this.option4,
        this.correctAns,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? quizSubjectId;
    String? quizTopicsId;
    String? question;
    String? option1;
    String? option2;
    String? option3;
    String? option4;
    String? correctAns;
    DateTime? createdAt;
    dynamic updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        quizSubjectId: json["quiz_subject_id"],
        quizTopicsId: json["quiz_topics_id"],
        question: json["question"],
        option1: json["option1"],
        option2: json["option2"],
        option3: json["option3"],
        option4: json["option4"],
        correctAns: json["correct_ans"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "quiz_subject_id": quizSubjectId,
        "quiz_topics_id": quizTopicsId,
        "question": question,
        "option1": option1,
        "option2": option2,
        "option3": option3,
        "option4": option4,
        "correct_ans": correctAns,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt,
    };
}
