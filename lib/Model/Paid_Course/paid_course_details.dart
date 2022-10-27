// To parse this JSON data, do
//
//     final paidCoursedetails = paidCoursedetailsFromJson(jsonString);

import 'dart:convert';

PaidCoursedetails paidCoursedetailsFromJson(String str) => PaidCoursedetails.fromJson(json.decode(str));

String paidCoursedetailsToJson(PaidCoursedetails data) => json.encode(data.toJson());

class PaidCoursedetails {
    PaidCoursedetails({
        this.status,
        this.data,
    });

    bool? status;
    Data? data;

    factory PaidCoursedetails.fromJson(Map<String, dynamic> json) => PaidCoursedetails(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
    };
}

class Data {
    Data({
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
        this.instructorInfo,
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
    DateTime? createdAt;
    DateTime? updatedAt;
    List<InstructorInfo>? instructorInfo;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        instructorInfo: List<InstructorInfo>.from(json["instructor_info"].map((x) => InstructorInfo.fromJson(x))),
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
        "instructor_info": List<dynamic>.from(instructorInfo!.map((x) => x.toJson())),
    };
}

class InstructorInfo {
    InstructorInfo({
        this.name,
        this.subTitle,
        this.description,
        this.image,
    });

    String? name;
    String? subTitle;
    String? description;
    String? image;

    factory InstructorInfo.fromJson(Map<String, dynamic> json) => InstructorInfo(
        name: json["name"],
        subTitle: json["sub_title"],
        description: json["description"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "sub_title": subTitle,
        "description": description,
        "image": image,
    };
}
