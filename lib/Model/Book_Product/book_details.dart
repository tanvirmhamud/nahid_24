// To parse this JSON data, do
//
//     final bookproductdetaills = bookproductdetaillsFromJson(jsonString);

import 'dart:convert';

Bookproductdetaills bookproductdetaillsFromJson(String str) => Bookproductdetaills.fromJson(json.decode(str));

String bookproductdetaillsToJson(Bookproductdetaills data) => json.encode(data.toJson());

class Bookproductdetaills {
    Bookproductdetaills({
        this.error,
        this.data,
    });

    bool? error;
    Data? data;

    factory Bookproductdetaills.fromJson(Map<String, dynamic> json) => Bookproductdetaills(
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
        this.desc,
        this.price,
        this.photo,
        this.readSome,
        this.isBook,
        this.evidence,
        this.libraryList,
        this.stock,
        this.status,
       
    });

    int? id;
    String? name;
    String? desc;
    String? price;
    String? photo;
    String? readSome;
    String? isBook;
    String? evidence;
    String? libraryList;
    String? stock;
    String? status;
 

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        desc: json["desc"],
        price: json["price"],
        photo: json["photo"],
        readSome: json["read_some"],
        isBook: json["is_book"],
        evidence: json["evidence"],
        libraryList: json["library_list"],
        stock: json["stock"],
        status: json["status"],
       
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "photo": photo,
        "read_some": readSome,
        "is_book": isBook,
        "evidence": evidence,
        "library_list": libraryList,
        "stock": stock,
        "status": status,
 
    };
}
