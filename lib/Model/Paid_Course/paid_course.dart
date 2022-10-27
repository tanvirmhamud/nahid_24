// To parse this JSON data, do
//
//     final paidCourse = paidCourseFromJson(jsonString);

import 'dart:convert';

PaidCourse paidCourseFromJson(String str) => PaidCourse.fromJson(json.decode(str));

String paidCourseToJson(PaidCourse data) => json.encode(data.toJson());

class PaidCourse {
    PaidCourse({
        this.status,
        this.data,
    });

    bool? status;
    List<PAidcourseDatum>? data;

    factory PaidCourse.fromJson(Map<String, dynamic> json) => PaidCourse(
        status: json["status"],
        data: List<PAidcourseDatum>.from(json["data"].map((x) => PAidcourseDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class PAidcourseDatum {
    PAidcourseDatum({
        this.id,
        this.courseName,
        this.image,
        this.instructors,
        this.description,
        this.duration,
        this.videoQty,
        this.price,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? courseName;
    String? image;
    String? instructors;
    String? description;
    String? duration;
    String? videoQty;
    String? price;
    String? status;
    DateTime ?createdAt;
    DateTime? updatedAt;

    factory PAidcourseDatum.fromJson(Map<String, dynamic> json) => PAidcourseDatum(
        id: json["id"],
        courseName: json["course_name"],
        image: json["image"],
        instructors: json["instructors"],
        description: json["description"],
        duration: json["duration"],
        videoQty: json["video_qty"],
        price: json["price"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "course_name": courseName,
        "image": image,
        "instructors": instructors,
        "description": description,
        "duration": duration,
        "video_qty": videoQty,
        "price": price,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
