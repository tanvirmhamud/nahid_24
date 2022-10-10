// To parse this JSON data, do
//
//     final modeltestmcq = modeltestmcqFromJson(jsonString);

import 'dart:convert';

Modeltestmcq modeltestmcqFromJson(String str) => Modeltestmcq.fromJson(json.decode(str));

String modeltestmcqToJson(Modeltestmcq data) => json.encode(data.toJson());

class Modeltestmcq {
    Modeltestmcq({
        this.error,
        this.data,
    });

    bool? error;
    List<Datum>? data;

    factory Modeltestmcq.fromJson(Map<String, dynamic> json) => Modeltestmcq(
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
        this.topicId,
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
    String? subjectId;
    String? topicId;
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
        subjectId: json["subject_id"],
        topicId: json["topic_id"],
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
        "subject_id": subjectId,
        "topic_id": topicId,
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
