import 'package:duck_duck_shop/data.dart';

abstract class ItemsRepository {
  Stream<List<ItemData>> getAllItems();
}
