// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class CourseModel extends Equatable {
  final int id;
  final String title;
  final String Class;
  final String subject_name;
  final String url;
  final String thumbnail;

  const CourseModel({
    required this.id,
    required this.title,
    required this.Class,
    required this.subject_name,
    required this.url,
    required this.thumbnail,
  });

  CourseModel copyWith({
    int? id,
    String? title,
    String? Class,
    String? subject_name,
    String? url,
    String? thumbnail,
    String? created_at,
    String? updated_at,
  }) {
    return CourseModel(
      id: id ?? this.id,
      title: title ?? this.title,
      Class: Class ?? this.Class,
      subject_name: subject_name ?? this.subject_name,
      url: url ?? this.url,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'Class': Class,
      'subject_name': subject_name,
      'url': url,
      'thumbnail': thumbnail,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id: map['id'] as int,
      title: map['title'] as String,
      Class: map['class'] as String,
      subject_name: map['subject_name'] as String,
      url: map['url'] as String,
      thumbnail: map['thumbnail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseModel.fromJson(String source) =>
      CourseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      title,
      Class,
      subject_name,
      url,
      thumbnail,
    ];
  }

  factory CourseModel.init() => CourseModel(
        id: 0,
        title: '',
        Class: '',
        subject_name: '',
        url: '',
        thumbnail: '',
      );
}
