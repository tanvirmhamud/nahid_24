// To parse this JSON data, do
//
//     final modeltexttopic = modeltexttopicFromJson(jsonString);

import 'dart:convert';

Modeltexttopic modeltexttopicFromJson(String str) => Modeltexttopic.fromJson(json.decode(str));

String modeltexttopicToJson(Modeltexttopic data) => json.encode(data.toJson());

class Modeltexttopic {
    Modeltexttopic({
        this.error,
        this.data,
    });

    bool? error;
    List<Datum> ?data;

    factory Modeltexttopic.fromJson(Map<String, dynamic> json) => Modeltexttopic(
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
        this.titleId,
        this.testSubjectId,
        this.testTopicName,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? titleId;
    String?testSubjectId;
    String? testTopicName;
    DateTime? createdAt;
    dynamic updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        titleId: json["title_id"],
        testSubjectId: json["test_subject_id"],
        testTopicName: json["test_topic_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title_id": titleId,
        "test_subject_id": testSubjectId,
        "test_topic_name": testTopicName,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt,
    };
}
