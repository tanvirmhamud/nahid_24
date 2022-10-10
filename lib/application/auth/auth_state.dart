import 'package:clean_api/clean_api.dart';
import 'package:equatable/equatable.dart';

import 'package:nahid_24/domain/app/user_profile.dart';

class AuthState extends Equatable {
  final bool loading;
  final CleanFailure failure;
  final UserProfile userProfile;
  AuthState({
    required this.loading,
    required this.failure,
    required this.userProfile,
  });

  AuthState copyWith({
    bool? loading,
    CleanFailure? failure,
    UserProfile? userProfile,
  }) {
    return AuthState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      userProfile: userProfile ?? this.userProfile,
    );
  }

  factory AuthState.init() => AuthState(
      loading: false,
      failure: CleanFailure.none(),
      userProfile: UserProfile.empty());

  @override
  String toString() =>
      'AuthState(loading: $loading, failure: $failure, userProfile: $userProfile)';

  @override
  List<Object> get props => [loading, failure, userProfile];
}
