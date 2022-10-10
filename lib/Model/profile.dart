// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
    Profile({
        this.error,
        this.data,
    });

    bool? error;
    Data? data;

    factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        error: json["error"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.id,
        this.name,
        this.image,
        this.number,
        this.email,
        this.emailVerifiedAt,
        this.isActive,
   
        this.institute,
    });

    int? id;
    String? name;
    dynamic image;
    String? number;
    String? email;
    dynamic emailVerifiedAt;
    String ?isActive;
   
    String ?institute;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        number: json["number"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        isActive: json["is_active"],
     
        institute: json["institute"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "number": number,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "is_active": isActive,
     
        "institute": institute,
    };
}
