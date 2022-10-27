// To parse this JSON data, do
//
//     final examSubject = examSubjectFromJson(jsonString);

import 'dart:convert';

ExamSubject examSubjectFromJson(String str) => ExamSubject.fromJson(json.decode(str));

String examSubjectToJson(ExamSubject data) => json.encode(data.toJson());

class ExamSubject {
    ExamSubject({
        this.error,
        this.data,
    });

    bool? error;
    List<Datum> ?data;

    factory ExamSubject.fromJson(Map<String, dynamic> json) => ExamSubject(
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
        this.subjectName,
      
    });

    int? id;
    String? subjectName;
   

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        subjectName: json["subject_name"],
      
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "subject_name": subjectName,
      
    };
}
