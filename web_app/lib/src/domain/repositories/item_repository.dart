import 'package:web_app/src/domain/entities/computer.dart';
import 'package:web_app/src/domain/entities/item.dart';
import 'package:web_app/src/domain/entities/phone.dart';
import 'package:web_app/src/domain/entities/private_lesson.dart';
import 'package:web_app/src/domain/entities/vehicle.dart';

abstract class ItemRepository {
  Future<void> getAccessToken();
  Future<List<Item>> getComputers();
  Future<List<Item>> getPhones();
  Future<List<Item>> getVehicles();
  Future<List<Item>> getPrivateLessons();
  Future<void> addItem(Item item);
  Future<void> deleteItem(Item item);
}
