// To parse this JSON data, do
//
//     final productlist = productlistFromJson(jsonString);

import 'dart:convert';

Productlist productlistFromJson(String str) => Productlist.fromJson(json.decode(str));

String productlistToJson(Productlist data) => json.encode(data.toJson());

class Productlist {
    Productlist({
        this.error,
        this.data,
    });

    bool? error;
    List<ProductDatum>? data;

    factory Productlist.fromJson(Map<String, dynamic> json) => Productlist(
        error: json["error"],
        data: List<ProductDatum>.from(json["data"].map((x) => ProductDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class ProductDatum {
    ProductDatum({
        this.id,
        this.name,
        this.desc,
        this.price,
        this.photo,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? name;
    String? desc;
    String? price;
    String? photo;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory ProductDatum.fromJson(Map<String, dynamic> json) => ProductDatum(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        price: json["price"],
        photo: json["photo"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "photo": photo,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    };
}
