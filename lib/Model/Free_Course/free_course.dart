// To parse this JSON data, do
//
//     final freeCourse = freeCourseFromJson(jsonString);

import 'dart:convert';

FreeCourse freeCourseFromJson(String str) => FreeCourse.fromJson(json.decode(str));

String freeCourseToJson(FreeCourse data) => json.encode(data.toJson());

class FreeCourse {
    FreeCourse({
        this.status,
        this.data,
    });

    bool? status;
    List<Freecoursedatum>? data;

    factory FreeCourse.fromJson(Map<String, dynamic> json) => FreeCourse(
        status: json["status"],
        data: List<Freecoursedatum>.from(json["data"].map((x) => Freecoursedatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Freecoursedatum {
    Freecoursedatum({
        this.id,
        this.name,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.course,
    });

    int? id;
    String? name;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<Course>? course;

    factory Freecoursedatum.fromJson(Map<String, dynamic> json) => Freecoursedatum(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        course: List<Course>.from(json["course"].map((x) => Course.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "course": List<dynamic>.from(course!.map((x) => x.toJson())),
    };
}

class Course {
    Course({
        this.id,
        this.courseName,
        this.categoryId,
        this.image,
        this.instructorName,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? courseName;
    String? categoryId;
    String? image;
    String? instructorName;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        courseName: json["course_name"],
        categoryId: json["category_id"],
        image: json["image"],
        instructorName: json["instructor_name"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "course_name": courseName,
        "category_id": categoryId,
        "image": image,
        "instructor_name": instructorName,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
