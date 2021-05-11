import 'package:cloud_firestore/cloud_firestore.dart';

class CloudDb {
  CloudDb(this._instance)
      : trips = _Store(_instance, 'items'),
        accounts = _Store(_instance, 'accounts');

  final FirebaseFirestore _instance;
  final _Store trips;
  final _Store accounts;

  DocumentReference get settings => _instance.doc('settings/common');

  Future<void> batchAction(void Function(WriteBatch batch) action) {
    final batch = _instance.batch();

    action(batch);

    return batch.commit();
  }
}

class _Store {
  _Store(this.store, this.path);

  final FirebaseFirestore store;
  final String path;

  Query fetchAll(String userId) => store.collection(path).where('accountID', isEqualTo: userId);

  DocumentReference fetchOne(String uuid) => store.doc('$path/$uuid');
}
