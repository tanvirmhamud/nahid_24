// To parse this JSON data, do
//
//     final liveClass = liveClassFromJson(jsonString);

import 'dart:convert';

LiveClass liveClassFromJson(String str) => LiveClass.fromJson(json.decode(str));

String liveClassToJson(LiveClass data) => json.encode(data.toJson());

class LiveClass {
    LiveClass({
        this.status,
        this.data,
    });

    bool? status;
    List<Datum>? data;

    factory LiveClass.fromJson(Map<String, dynamic> json) => LiveClass(
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

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
    };
}
