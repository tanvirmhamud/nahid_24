// To parse this JSON data, do
//
//     final myorderlist = myorderlistFromJson(jsonString);

import 'dart:convert';

Myorderlist myorderlistFromJson(String str) => Myorderlist.fromJson(json.decode(str));

String myorderlistToJson(Myorderlist data) => json.encode(data.toJson());

class Myorderlist {
    Myorderlist({
        this.error,
        this.data,
    });

    bool? error;
    List<Datum>? data;

    factory Myorderlist.fromJson(Map<String, dynamic> json) => Myorderlist(
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
        this.totalBill,
        this.info,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? userId;
    String? totalBill;
    String? info;
    String? status;
    DateTime? createdAt;
    dynamic updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        totalBill: json["total_bill"],
        info: json["info"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "total_bill": totalBill,
        "info": info,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt,
    };
}
