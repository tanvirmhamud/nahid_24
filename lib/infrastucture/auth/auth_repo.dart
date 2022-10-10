import 'package:nahid_24/domain/app/user_profile.dart';
import 'package:clean_api/clean_api.dart';
import 'package:nahid_24/domain/auth/auth_response.dart';
import 'package:nahid_24/domain/auth/i_auth_repo.dart';

import 'package:nahid_24/domain/auth/signup_body.dart';
import 'package:nahid_24/domain/auth/login_body.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo extends IAuthRepo {
  final api = CleanApi.instance;

  @override
  Future<Either<CleanFailure, UserProfile>> login(LoginBody body) async {
    final data = await api.post(
        fromData: (json) => AuthResponse.fromMap(json),
        body: body.toMap(),
        endPoint: "login");

    return data.fold((l) => left(l), (r) async {
      final preferences = await SharedPreferences.getInstance();
      preferences.setString('token', r.token);
      api.setToken({'Authorization': 'Bearer ${r.token}'});
      return right(r.info);
    });
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<CleanFailure, Unit>> registration(SignUpBody body) async {
    return await api.post(
        fromData: (json) => unit, body: body.toMap(), endPoint: "register");

    // return data.fold((l) => left(l), (r) {
    //   preferences.setString('token', r.token);
    //   api.setToken({'Authorization': 'Bearer ${r.token}'});
    //   // return right(r.info);
    // });
  }

  @override
  Future<UserProfile> checkAuthStatus() {
    // TODO: implement checkAuthStatus
    throw UnimplementedError();
  }
}
