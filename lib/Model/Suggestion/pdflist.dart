// To parse this JSON data, do
//
//     final pdflist = pdflistFromJson(jsonString);

import 'dart:convert';

Pdflist pdflistFromJson(String str) => Pdflist.fromJson(json.decode(str));

String pdflistToJson(Pdflist data) => json.encode(data.toJson());

class Pdflist {
    Pdflist({
        this.status,
        this.data,
    });

    bool? status;
    List<Datum>? data;

    factory Pdflist.fromJson(Map<String, dynamic> json) => Pdflist(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.suggestionCatId,
        this.suggestionTopicId,
        this.title,
        this.suggestionFile,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? suggestionCatId;
    String? suggestionTopicId;
    String? title;
    String? suggestionFile;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        suggestionCatId: json["suggestion_cat_id"],
        suggestionTopicId: json["suggestion_topic_id"],
        title: json["title"],
        suggestionFile: json["suggestion_file"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "suggestion_cat_id": suggestionCatId,
        "suggestion_topic_id": suggestionTopicId,
        "title": title,
        "suggestion_file": suggestionFile,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
