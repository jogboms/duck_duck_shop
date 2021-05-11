import 'package:firebase_auth/firebase_auth.dart';

class FireUser {
  FireUser(this._reference);

  final FirebaseUser _reference;

  String get uuid => _reference?.uid;
}
