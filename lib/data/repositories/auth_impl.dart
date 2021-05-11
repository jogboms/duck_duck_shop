import 'package:duck_duck_shop/data.dart';
import 'package:duck_duck_shop/domain.dart';
import 'package:flutter/foundation.dart';

import '../network.dart';

class AuthImpl extends AuthRepository {
  AuthImpl({@required this.firebase});

  final Firebase firebase;

  @override
  Future<void> signIn() => firebase.auth.signInWithGoogle();

  @override
  Stream<String> get onAuthStateChangedInternal => firebase.auth.onAuthStateChanged.map((convert) => convert.uuid);

  @override
  Future<void> signOut() => firebase.auth.signOutWithGoogle();
}
