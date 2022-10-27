// To parse this JSON data, do
//
//     final freeCourseVideo = freeCourseVideoFromJson(jsonString);

import 'dart:convert';

FreeCourseVideo freeCourseVideoFromJson(String str) => FreeCourseVideo.fromJson(json.decode(str));

String freeCourseVideoToJson(FreeCourseVideo data) => json.encode(data.toJson());

class FreeCourseVideo {
    FreeCourseVideo({
        this.status,
        this.data,
    });

    bool? status;
    FreeCourseVideoData? data;

    factory FreeCourseVideo.fromJson(Map<String, dynamic> json) => FreeCourseVideo(
        status: json["status"],
        data: FreeCourseVideoData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
    };
}

class FreeCourseVideoData {
    FreeCourseVideoData({
        this.id,
        this.courseName,
        this.categoryId,
        this.image,
        this.instructorName,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.video,
    });

    int? id;
    String? courseName;
    String ?categoryId;
    String? image;
    String? instructorName;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    List<Video>? video;

    factory FreeCourseVideoData.fromJson(Map<String, dynamic> json) => FreeCourseVideoData(
        id: json["id"],
        courseName: json["course_name"],
        categoryId: json["category_id"],
        image: json["image"],
        instructorName: json["instructor_name"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        video: List<Video>.from(json["video"].map((x) => Video.fromJson(x))),
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
        "video": List<dynamic>.from(video!.map((x) => x.toJson())),
    };
}

class Video {
    Video({
        this.id,
        this.courseId,
        this.url,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? courseId;
    String? url;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        courseId: json["course_id"],
        url: json["url"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "course_id": courseId,
        "url": url,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
