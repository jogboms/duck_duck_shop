import 'package:flutter/foundation.dart';

abstract class AuthRepository {
  Future<void> signIn();

  Stream<String> get onAuthStateChanged => onAuthStateChangedInternal;

  @protected
  Stream<String> get onAuthStateChangedInternal;

  Future<void> signOut();
}
