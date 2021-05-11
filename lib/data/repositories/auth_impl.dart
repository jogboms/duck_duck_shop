import 'package:duck_duck_shop/data.dart';
import 'package:duck_duck_shop/domain.dart';

class AuthImpl implements AuthRepository {
  @override
  Stream<AccountData> getAccount(String uuid) {
    // TODO: implement getAccount
    throw UnimplementedError();
  }

  @override
  // TODO: implement onAuthStateChanged
  Stream<String> get onAuthStateChanged => throw UnimplementedError();

  @override
  // TODO: implement onAuthStateChangedInternal
  Stream<String> get onAuthStateChangedInternal => throw UnimplementedError();

  @override
  Future<void> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(AccountData account) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
