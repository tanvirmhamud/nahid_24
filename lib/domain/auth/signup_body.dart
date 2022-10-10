import 'dart:convert';

import 'package:equatable/equatable.dart';

class SignUpBody extends Equatable {
  final String name;
  final String number;
  final String email;
  final String password;
  SignUpBody({
    required this.name,
    required this.number,
    required this.email,
    required this.password,
  });

  SignUpBody copyWith({
    String? name,
    String? number,
    String? email,
    String? password,
  }) {
    return SignUpBody(
      name: name ?? this.name,
      number: number ?? this.number,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'number': number,
      'email': email,
      'password': password,
    };
  }

  factory SignUpBody.fromMap(Map<String, dynamic> map) {
    return SignUpBody(
      name: map['name'] ?? '',
      number: map['number'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpBody.fromJson(String source) =>
      SignUpBody.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SignUpBody(name: $name, number: $number, email: $email, password: $password)';
  }

  @override
  List<Object> get props => [name, number, email, password];
}
