import 'package:web_app/src/domain/entities/item.dart';
import 'package:web_app/src/domain/entities/user.dart';

abstract class ItemRepository {
  Future<void> getAccessToken();
  Future<List<Item>?> getItems(String? category, int limit, int skip);
  Future<List<Item>?> getFavoriteItems(User user, int limit, int skip);
  Future<List<Item>?> getMyItems(User user, int limit, int skip);
  Future<void> addItem(Item item);
  Future<void> deleteItem(Item item);
  Future<void> updateItem(Item item);
  Future<void> addItemToFavorites(User user, Item item);
  Future<void> deleteItemFromFavorites(User user, Item item);
  Future<void> sendUpdatedPriceMail(Item item, String? previousPrice, String? newPrice);
}
