// To parse this JSON data, do
//
//     final liveclassorder = liveclassorderFromJson(jsonString);

import 'dart:convert';

Liveclassorder liveclassorderFromJson(String str) => Liveclassorder.fromJson(json.decode(str));

String liveclassorderToJson(Liveclassorder data) => json.encode(data.toJson());

class Liveclassorder {
    Liveclassorder({
        this.status,
        this.data,
    });

    bool? status;
    List<Datum>? data;

    factory Liveclassorder.fromJson(Map<String, dynamic> json) => Liveclassorder(
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
        this.userId,
        this.classId,
        this.userName,
        this.number,
        this.paymentMethod,
        this.paymentNumber,
        this.transactionId,
        this.amount,
        this.orderStatus,
        this.createdAt,
        this.updatedAt,
    });

    int ?id;
    String? userId;
    String ?classId;
    String? userName;
    String? number;
    String? paymentMethod;
    String? paymentNumber;
    String? transactionId;
    String? amount;
    String? orderStatus;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        classId: json["class_id"],
        userName: json["user_name"],
        number: json["number"],
        paymentMethod: json["payment_method"],
        paymentNumber: json["payment_number"],
        transactionId: json["transaction_id"],
        amount: json["amount"],
        orderStatus: json["order_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "class_id": classId,
        "user_name": userName,
        "number": number,
        "payment_method": paymentMethod,
        "payment_number": paymentNumber,
        "transaction_id": transactionId,
        "amount": amount,
        "order_status": orderStatus,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
