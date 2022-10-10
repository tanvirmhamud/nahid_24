// To parse this JSON data, do
//
//     final jobVideoSubject = jobVideoSubjectFromJson(jsonString);

import 'dart:convert';

JobVideoSubject jobVideoSubjectFromJson(String str) => JobVideoSubject.fromJson(json.decode(str));

String jobVideoSubjectToJson(JobVideoSubject data) => json.encode(data.toJson());

class JobVideoSubject {
    JobVideoSubject({
        this.error,
        this.data,
    });

    bool? error;
    List<Datum>? data;

    factory JobVideoSubject.fromJson(Map<String, dynamic> json) => JobVideoSubject(
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
        this.title,
        this.datumClass,
        this.subjectName,
        this.url,
        this.thumbnail,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? title;
    String? datumClass;
    String? subjectName;
    String? url;
    String? thumbnail;
    DateTime? createdAt;
    dynamic updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        datumClass: json["class"],
        subjectName: json["subject_name"],
        url: json["url"],
        thumbnail: json["thumbnail"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "class": datumClass,
        "subject_name": subjectName,
        "url": url,
        "thumbnail": thumbnail,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt,
    };
}
