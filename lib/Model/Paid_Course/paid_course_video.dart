// To parse this JSON data, do
//
//     final paidCoursevideo = paidCoursevideoFromJson(jsonString);

import 'dart:convert';

PaidCoursevideo paidCoursevideoFromJson(String str) => PaidCoursevideo.fromJson(json.decode(str));

String paidCoursevideoToJson(PaidCoursevideo data) => json.encode(data.toJson());

class PaidCoursevideo {
    PaidCoursevideo({
        this.status,
        this.data,
    });

    bool? status;
    List<Datum>? data;

    factory PaidCoursevideo.fromJson(Map<String, dynamic> json) => PaidCoursevideo(
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
        this.premiumCourseId,
        this.url,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? premiumCourseId;
    String? url;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        premiumCourseId: json["premium_course_id"],
        url: json["url"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "premium_course_id": premiumCourseId,
        "url": url,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
