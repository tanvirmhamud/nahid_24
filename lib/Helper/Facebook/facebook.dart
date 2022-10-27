import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookHelper {
  FacebookAuth? _facebookAuth;
  bool? _isLogged;
  bool _fetching = false;

  Future<Map<String, dynamic>?> login() async {
    _fetching = true;

    final LoginResult result = await FacebookAuth.i.login();

    _isLogged = result.status == LoginStatus.success;
    if (_isLogged!) {
      var _userData = await FacebookAuth.i.getUserData();
      return _userData;
    } else {
      return null;
    }
  }
}