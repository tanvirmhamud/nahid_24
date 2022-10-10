import 'package:clean_api/clean_api.dart';
import 'package:nahid_24/domain/app/user_profile.dart';
import 'package:nahid_24/domain/auth/login_body.dart';
import 'package:nahid_24/domain/auth/signup_body.dart';

abstract class IAuthRepo {
  Future<Either<CleanFailure, UserProfile>> login(LoginBody body);
  Future<Either<CleanFailure, Unit>> registration(SignUpBody body);
  Future<UserProfile> checkAuthStatus();
}
