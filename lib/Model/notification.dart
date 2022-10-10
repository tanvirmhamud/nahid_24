// To parse this JSON data, do
//
//     final notification = notificationFromJson(jsonString);

import 'dart:convert';

NotificationDAta notificationFromJson(String str) =>
    NotificationDAta.fromJson(json.decode(str));

String notificationToJson(NotificationDAta data) => json.encode(data.toJson());

class NotificationDAta {
  NotificationDAta({
    this.error,
    this.data,
  });

  bool? error;
  List<Datum>? data;

  factory NotificationDAta.fromJson(Map<String, dynamic> json) =>
      NotificationDAta(
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
    this.userId,
    this.type,
    this.title,
    this.message,
  });

  int? id;
  dynamic userId;
  String? type;
  dynamic title;
  dynamic message;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        type: json["type"],
        title: json["title"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "type": type,
        "title": title,
        "message": message,
      };
}
