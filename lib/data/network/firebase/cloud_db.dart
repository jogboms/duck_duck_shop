import 'package:cloud_firestore/cloud_firestore.dart';

class CloudDb {
  CloudDb(FirebaseFirestore _instance) : items = _Store(_instance, 'items');

  final _Store items;
}

class _Store {
  _Store(this.store, this.path);

  final FirebaseFirestore store;
  final String path;

  Query fetchAll() => store.collection(path);
}
