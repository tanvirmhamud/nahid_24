// To parse this JSON data, do
//
//     final modelSubject = modelSubjectFromJson(jsonString);

import 'dart:convert';

List<ModelSubject> modelSubjectFromJson(String str) => List<ModelSubject>.from(json.decode(str).map((x) => ModelSubject.fromJson(x)));

String modelSubjectToJson(List<ModelSubject> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelSubject {
    ModelSubject({
        this.title,
        this.subjects,
    });

    String? title;
    List<Subject>? subjects;

    factory ModelSubject.fromJson(Map<String, dynamic> json) => ModelSubject(
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
        this.titleId,
        this.testSubject,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? titleId;
    String?testSubject;
    DateTime? createdAt;
    dynamic updatedAt;

    factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["id"],
        titleId: json["title_id"],
        testSubject: json["test_subject"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title_id": titleId,
        "test_subject": testSubject,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt,
    };
}
