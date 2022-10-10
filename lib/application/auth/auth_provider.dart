import 'package:clean_api/clean_api.dart';
import 'package:nahid_24/application/auth/auth_state.dart';
import 'package:nahid_24/domain/auth/i_auth_repo.dart';
import 'package:nahid_24/domain/auth/login_body.dart';
import 'package:nahid_24/domain/auth/signup_body.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../infrastucture/auth/auth_repo.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(AuthRepo());
});

class AuthNotifier extends StateNotifier<AuthState> {
  final IAuthRepo iAuthRepo;
  AuthNotifier(this.iAuthRepo) : super(AuthState.init());

  checkAuthStatus() async {
    state = state.copyWith(loading: true);
    final response = await iAuthRepo.checkAuthStatus();
    // response.match((t) {
    //   iAuthRepo.setToken();
    // }, () => null);
    state = state.copyWith(userProfile: response, loading: false);
  }

  login(LoginBody body) async {
    state = AuthState.init().copyWith(loading: true);
    final response = await iAuthRepo.login(body);
    state = response
        .fold((l) => state.copyWith(failure: l),
            (r) => state.copyWith(userProfile: r))
        .copyWith(loading: false);
  }

  singUp(SignUpBody body) async {
    state = AuthState.init().copyWith(loading: true);
    final response = await iAuthRepo.registration(body);
    state = response
        .fold((l) => state.copyWith(failure: l),
            (r) => state.copyWith(failure: CleanFailure.none()))
        .copyWith(loading: false);
  }

  // logout() async {
  //   await iAuthRepo.logout();
  //   state = AuthState.init();
  // }
}
