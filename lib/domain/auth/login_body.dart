import 'dart:convert';

import 'package:equatable/equatable.dart';

class LoginBody extends Equatable {
  final String number;
  final String password;
  LoginBody({
    required this.number,
    required this.password,
  });

  LoginBody copyWith({
    String? number,
    String? password,
  }) {
    return LoginBody(
      number: number ?? this.number,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'password': password,
    };
  }

  factory LoginBody.fromMap(Map<String, dynamic> map) {
    return LoginBody(
      number: map['number'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginBody.fromJson(String source) =>
      LoginBody.fromMap(json.decode(source));

  @override
  String toString() => 'LoginBody(number: $number, password: $password)';

  @override
  List<Object> get props => [number, password];
}
