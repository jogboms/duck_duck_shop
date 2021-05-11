import 'package:duck_duck_shop/data.dart';
import 'package:duck_duck_shop/domain.dart';
import 'package:flutter/foundation.dart';

import '../network.dart';

class ItemsImpl implements ItemsRepository {
  ItemsImpl({@required this.firebase});

  final Firebase firebase;

  @override
  Stream<List<ItemData>> getAllItems() {
    return firebase.db.items.fetchAll().snapshots().map((snapshot) {
      return snapshot.docs.map((element) {
        final data = element.data();
        return ItemData(name: data['name'], price: data['price'], url: data['url']);
      }).toList();
    });
  }
}
