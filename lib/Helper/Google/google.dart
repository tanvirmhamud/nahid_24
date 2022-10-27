import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Googlehelper {
  final googlesignin = GoogleSignIn();

  GoogleSignInAccount? user;

  Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    googlesignin.signOut();
    final googleUser = await googlesignin.signIn();
    if (googleUser != null) {
      user = googleUser;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
  }
}