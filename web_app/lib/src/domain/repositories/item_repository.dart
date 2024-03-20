import 'package:web_app/src/domain/entities/item.dart';

abstract class ItemRepository {
  Future<void> getAccessToken();
  Future<List<Item>> getComputers();
  Future<List<Item>> getPhones();
  Future<List<Item>> getVehicles();
  Future<List<Item>> getPrivateLessons();
  Future<void> addItem(Item item);
  Future<void> deleteItem(Item item);
  Future<void> updateItem(Item item);
}
