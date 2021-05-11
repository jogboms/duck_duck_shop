import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'models.dart';

class Auth {
  Auth(this._auth, this._googleSignIn);

  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  Future<FireUser> get getUser => _auth.currentUser().then(_mapFirebaseUserToUser);

  Stream<FireUser> get onAuthStateChanged => _auth.onAuthStateChanged.map(_mapFirebaseUserToUser);

  Future<void> signInWithGoogle() async {
    try {
      var currentUser = _googleSignIn.currentUser;
      currentUser ??= await _googleSignIn.signInSilently();
      currentUser ??= await _googleSignIn.signIn();

      if (currentUser == null) {
        throw PlatformException(code: GoogleSignIn.kSignInCanceledError);
      }

      final auth = await currentUser.authentication;

      final credential = GoogleAuthProvider.getCredential(
        accessToken: auth.accessToken,
        idToken: auth.idToken,
      );
      final user = await _auth.signInWithCredential(credential);
      assert(user != null);
    } on PlatformException catch (e) {
      if (e.code == GoogleSignIn.kSignInCanceledError) {
        return;
      }
      if (e.message?.contains('administrator') ?? false) {
        throw Exception('It seems this account has been disabled. Contact an Admin.');
      }
      if (_containsAny(e.message, ['NETWORK_ERROR', 'network'])) {
        throw Exception('No internet available');
      }
      throw Exception('Sorry, We could not connect. Try again.');
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOutWithGoogle() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  FireUser _mapFirebaseUserToUser(FirebaseUser _user) {
    assert(_user != null);
    return FireUser(_user);
  }
}

bool _containsAny(String value, List<String> find) => find.fold(false, (acc, cur) => value?.contains(cur) ?? false);
