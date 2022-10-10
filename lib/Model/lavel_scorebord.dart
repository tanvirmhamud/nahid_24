// To parse this JSON data, do
//
//     final lavelScoreboard = lavelScoreboardFromJson(jsonString);

import 'dart:convert';

List<LavelScoreboard> lavelScoreboardFromJson(String str) => List<LavelScoreboard>.from(json.decode(str).map((x) => LavelScoreboard.fromJson(x)));

String lavelScoreboardToJson(List<LavelScoreboard> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LavelScoreboard {
    LavelScoreboard({
        this.totalMark,
        this.position,
        this.user,
    });

    String? totalMark;
    int? position;
    List<User>? user;

    factory LavelScoreboard.fromJson(Map<String, dynamic> json) => LavelScoreboard(
        totalMark: json["total_mark"],
        position: json["position"],
        user: List<User>.from(json["user"].map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total_mark": totalMark,
        "position": position,
        "user": List<dynamic>.from(user!.map((x) => x.toJson())),
    };
}

class User {
    User({
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
    String ?number;
    String? email;
    dynamic emailVerifiedAt;
    String? isActive;
    
    dynamic institute;

    factory User.fromJson(Map<String, dynamic> json) => User(
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
