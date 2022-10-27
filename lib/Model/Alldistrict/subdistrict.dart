// To parse this JSON data, do
//
//     final subdistrict = subdistrictFromJson(jsonString);

import 'dart:convert';

Subdistrict subdistrictFromJson(String str) => Subdistrict.fromJson(json.decode(str));

String subdistrictToJson(Subdistrict data) => json.encode(data.toJson());

class Subdistrict {
    Subdistrict({
        this.status,
        this.data,
    });

    bool? status;
    List<SubdistrictDatum>? data;

    factory Subdistrict.fromJson(Map<String, dynamic> json) => Subdistrict(
        status: json["status"],
        data: List<SubdistrictDatum>.from(json["data"].map((x) => SubdistrictDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class SubdistrictDatum {
    SubdistrictDatum({
        this.id,
        this.subDistrict,
    });

    int? id;
    String? subDistrict;

    factory SubdistrictDatum.fromJson(Map<String, dynamic> json) => SubdistrictDatum(
        id: json["id"],
        subDistrict: json["sub_district"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sub_district": subDistrict,
    };
}
