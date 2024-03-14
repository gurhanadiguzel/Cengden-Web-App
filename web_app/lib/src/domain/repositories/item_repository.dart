import 'package:web_app/src/domain/entities/item.dart';

abstract class ItemRepository {
  Future<List<Item>> getItems();
}
