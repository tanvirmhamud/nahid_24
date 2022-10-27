// To parse this JSON data, do
//
//     final liveClassvideo = liveClassvideoFromJson(jsonString);

import 'dart:convert';

LiveClassvideo liveClassvideoFromJson(String str) => LiveClassvideo.fromJson(json.decode(str));

String liveClassvideoToJson(LiveClassvideo data) => json.encode(data.toJson());

class LiveClassvideo {
    LiveClassvideo({
        this.status,
        this.data,
    });

    bool? status;
    Data? data;

    factory LiveClassvideo.fromJson(Map<String, dynamic> json) => LiveClassvideo(
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
        this.className,
        this.image,
        this.instructors,
        this.duration,
        this.quantity,
        this.details,
        this.price,
        this.joinClass,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.instructorInfo,
    });

    int? id;
    String? className;
    String? image;
    String? instructors;
    String? duration;
    String? quantity;
    String? details;
    String? price;
    String? joinClass;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    InstructorInfo? instructorInfo;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        className: json["class_name"],
        image: json["image"],
        instructors: json["instructors"],
        duration: json["duration"],
        quantity: json["quantity"],
        details: json["details"],
        price: json["price"],
        joinClass: json["join_class"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        instructorInfo: InstructorInfo.fromJson(json["instructor_info"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "class_name": className,
        "image": image,
        "instructors": instructors,
        "duration": duration,
        "quantity": quantity,
        "details": details,
        "price": price,
        "join_class": joinClass,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "instructor_info": instructorInfo!.toJson(),
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
