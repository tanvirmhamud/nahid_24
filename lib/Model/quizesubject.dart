// To parse this JSON data, do
//
//     final quizesubject = quizesubjectFromJson(jsonString);

import 'dart:convert';

List<Quizesubject> quizesubjectFromJson(String str) => List<Quizesubject>.from(json.decode(str).map((x) => Quizesubject.fromJson(x)));

String quizesubjectToJson(List<Quizesubject> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Quizesubject {
    Quizesubject({
        this.title,
        this.subjects,
    });

    String? title;
    List<Subject>? subjects;

    factory Quizesubject.fromJson(Map<String, dynamic> json) => Quizesubject(
        title: json["title"],
        subjects: List<Subject>.from(json["subjects"].map((x) => Subject.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "subjects": List<dynamic>.from(subjects!.map((x) => x.toJson())),
    };
}

class Subject {
    Subject({
        this.id,
        this.quizSubjectId,
        this.topicName,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? quizSubjectId;
    String? topicName;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["id"],
        quizSubjectId: json["quiz_subject_id"],
        topicName: json["topic_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "quiz_subject_id": quizSubjectId,
        "topic_name": topicName,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    };
}
