import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  final int id;
  final String name;
  final String phoneNumber;
  final String email;
  final String is_active;
  UserProfile({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.is_active,
  });

  UserProfile copyWith({
    int? id,
    String? name,
    String? phoneNumber,
    String? email,
    String? is_active,
  }) {
    return UserProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      is_active: is_active ?? this.is_active,
    );
  }

  factory UserProfile.empty() =>
      UserProfile(id: 0, name: '', phoneNumber: '', email: '', is_active: '');

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'is_active': is_active,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      email: map['email'] ?? '',
      is_active: map['is_active'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfile.fromJson(String source) =>
      UserProfile.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserProfile(id: $id, name: $name, phoneNumber: $phoneNumber, email: $email, is_active: $is_active)';
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      phoneNumber,
      email,
      is_active,
    ];
  }
}
