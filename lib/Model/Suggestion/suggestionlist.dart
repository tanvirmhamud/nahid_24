// To parse this JSON data, do
//
//     final suggestionList = suggestionListFromJson(jsonString);

import 'dart:convert';

SuggestionList suggestionListFromJson(String str) => SuggestionList.fromJson(json.decode(str));

String suggestionListToJson(SuggestionList data) => json.encode(data.toJson());

class SuggestionList {
    SuggestionList({
        this.status,
        this.data,
    });

    bool? status;
    List<Datum>? data;

    factory SuggestionList.fromJson(Map<String, dynamic> json) => SuggestionList(
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
        this.name,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.topic,
    });

    int? id;
    String? name;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<Topic>? topic;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        topic: List<Topic>.from(json["topic"].map((x) => Topic.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "topic": List<dynamic>.from(topic!.map((x) => x.toJson())),
    };
}

class Topic {
    Topic({
        this.id,
        this.suggestionCategoryId,
        this.name,
        this.description,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? suggestionCategoryId;
    String? name;
    String? description;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        id: json["id"],
        suggestionCategoryId: json["suggestion_category_id"],
        name: json["name"],
        description: json["description"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "suggestion_category_id": suggestionCategoryId,
        "name": name,
        "description": description,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
