import 'package:web_app/src/domain/entities/item.dart';
import 'package:web_app/src/domain/repositories/item_repository.dart';

class DataItemRepository implements ItemRepository {
  @override
  Future<List<Item>> getItems() async {
    List<Item> items = [];
    return items;
  }
}
