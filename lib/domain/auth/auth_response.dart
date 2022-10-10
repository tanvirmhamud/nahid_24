import 'dart:convert';

import 'package:nahid_24/domain/app/user_profile.dart';

class AuthResponse {
  final String token;
  final UserProfile info;
  AuthResponse({
    required this.token,
    required this.info,
  });

  AuthResponse copyWith({
    String? token,
    UserProfile? info,
  }) {
    return AuthResponse(
      token: token ?? this.token,
      info: info ?? this.info,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'info': info.toMap(),
    };
  }

  factory AuthResponse.fromMap(Map<String, dynamic> map) {
    return AuthResponse(
      token: map['token'] ?? '',
      info: UserProfile.fromMap(map['info']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthResponse.fromJson(String source) =>
      AuthResponse.fromMap(json.decode(source));

  @override
  String toString() => 'AuthResponse(token: $token, info: $info)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthResponse && other.token == token && other.info == info;
  }

  @override
  int get hashCode => token.hashCode ^ info.hashCode;
}
