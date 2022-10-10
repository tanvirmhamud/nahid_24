// To parse this JSON data, do
//
//     final searchData = searchDataFromJson(jsonString);

import 'dart:convert';

SearchData searchDataFromJson(String str) => SearchData.fromJson(json.decode(str));

String searchDataToJson(SearchData data) => json.encode(data.toJson());

class SearchData {
    SearchData({
        this.error,
        this.data,
    });

    bool? error;
    List<Datum>? data;

    factory SearchData.fromJson(Map<String, dynamic> json) => SearchData(
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
        this.title,
        this.datumClass,
        this.subjectName,
        this.url,
        this.thumbnail,
      
    });

    int? id;
    String? title;
    String? datumClass;
    String? subjectName;
    String? url;
    String? thumbnail;
    

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        datumClass: json["class"],
        subjectName: json["subject_name"],
        url: json["url"],
        thumbnail: json["thumbnail"],
       
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "class": datumClass,
        "subject_name": subjectName,
        "url": url,
        "thumbnail": thumbnail,
     
    };
}
