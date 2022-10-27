// To parse this JSON data, do
//
//     final alldistrict = alldistrictFromJson(jsonString);

import 'dart:convert';

Alldistrict alldistrictFromJson(String str) =>
    Alldistrict.fromJson(json.decode(str));

String alldistrictToJson(Alldistrict data) => json.encode(data.toJson());

class Alldistrict {
  Alldistrict({
    this.status,
    this.data,
  });

  bool? status;
  List<AlldistrictDatum>? data;

  factory Alldistrict.fromJson(Map<String, dynamic> json) => Alldistrict(
        status: json["status"],
        data: List<AlldistrictDatum>.from(
            json["data"].map((x) => AlldistrictDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class AlldistrictDatum {
  AlldistrictDatum({
    this.id,
    this.district,
  });

  int? id;
  String? district;

  factory AlldistrictDatum.fromJson(Map<String, dynamic> json) =>
      AlldistrictDatum(
        id: json["id"],
        district: json["district"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "district": district,
      };
}
