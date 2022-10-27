// To parse this JSON data, do
//
//     final subjectlist = subjectlistFromJson(jsonString);

import 'dart:convert';

Subjectlist subjectlistFromJson(String str) => Subjectlist.fromJson(json.decode(str));

String subjectlistToJson(Subjectlist data) => json.encode(data.toJson());

class Subjectlist {
    Subjectlist({
        this.error,
        this.data,
    });

    bool? error;
    List<Datum>? data;

    factory Subjectlist.fromJson(Map<String, dynamic> json) => Subjectlist(
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
        this.subjectName,
        this.thumbnail,
    });

    String? id;
    String? subjectName;
    String? thumbnail;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        subjectName: json["subject_name"],
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "subject_name": subjectName,
        "thumbnail": thumbnail,
    };
}
