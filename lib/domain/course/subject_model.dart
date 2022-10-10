import 'dart:convert';

import 'package:equatable/equatable.dart';

class SubjectModel extends Equatable {
  final String id;
  final String subjectName;
  final String thumbnail;
  SubjectModel({
    required this.id,
    required this.subjectName,
    required this.thumbnail,
  });

  SubjectModel copyWith({
    String? id,
    String? subjectName,
    String? thumbnail,
  }) {
    return SubjectModel(
      id: id ?? this.id,
      subjectName: subjectName ?? this.subjectName,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subject_name': subjectName,
      'thumbnail': thumbnail,
    };
  }

  factory SubjectModel.fromMap(Map<String, dynamic> map) {
    return SubjectModel(
      id: map['id'] != null
          ? map['id'] is String
              ? map['id']
              : map['id'].toString()
          : '',
      subjectName: map['subject_name'] ?? '',
      thumbnail: map['thumbnail'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectModel.fromJson(String source) =>
      SubjectModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'SubjectModel(id: $id, subjectName: $subjectName, thumbnail: $thumbnail)';

  @override
  List<Object> get props => [id, subjectName, thumbnail];
}
