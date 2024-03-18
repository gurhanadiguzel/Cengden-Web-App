import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:web_app/src/app/constants.dart';
import 'package:web_app/src/domain/entities/computer.dart';
import 'package:web_app/src/domain/entities/item.dart';
import 'package:web_app/src/domain/entities/phone.dart';
import 'package:web_app/src/domain/entities/private_lesson.dart';
import 'package:web_app/src/domain/entities/vehicle.dart';
import 'package:web_app/src/domain/repositories/item_repository.dart';

class DataItemRepository implements ItemRepository {
  final dio = Dio();

  String getCollectionType(Item item) {
    String collection;
    if (item is Computer) {
      collection = "computers";
    } else if (item is Phone) {
      collection = "phones";
    } else if (item is PrivateLesson) {
      collection = "privateLessons";
    } else if (item is Vehicle) {
      collection = "vehicles";
    } else {
      throw ArgumentError("Unknown item type");
    }
    return collection;
  }

  Future<void> getAccessToken() async {
    String appId = 'data-tbzss';
    String url = 'https://services.cloud.mongodb.com/api/client/v2.0/app/$appId/auth/providers/anon-user/login';

    try {
      var response = await dio.post(url);
      accessToken = response.data['access_token'];
    } catch (e, st) {
      print('Error making POST request: $e');
      print(st);
      rethrow;
    }
  }

  @override
  Future<List<Item>> getComputers() async {
    List<Item> items = [];

    try {
      var responseComputers = await dio.post(
        "$endpoint/action/find",
        options: Options(headers: headers),
        data: jsonEncode(
          {
            "dataSource": dataSource,
            "database": database,
            "collection": "computers",
            "filter": {
              "Item Visibility": true,
            },
          },
        ),
      );
      if (responseComputers.statusCode == 200) {
        List<dynamic> documents = responseComputers.data['documents'];
        documents.forEach(
          (doc) {
            items.add(Computer.fromJson(doc));
          },
        );
      }
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
    return items;
  }

  @override
  Future<List<Item>> getPhones() async {
    List<Item> items = [];

    try {
      var responsePhones = await dio.post(
        "$endpoint/action/find",
        options: Options(headers: headers),
        data: jsonEncode(
          {
            "dataSource": dataSource,
            "database": database,
            "collection": "phones",
            "filter": {
              "Item Visibility": true,
            },
          },
        ),
      );
      if (responsePhones.statusCode == 200) {
        List<dynamic> documents = responsePhones.data['documents'];
        documents.forEach(
          (doc) {
            items.add(Phone.fromJson(doc));
          },
        );
      }
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
    return items;
  }

  @override
  Future<List<Item>> getVehicles() async {
    List<Item> items = [];

    try {
      var responseVehicles = await dio.post(
        "$endpoint/action/find",
        options: Options(headers: headers),
        data: jsonEncode(
          {
            "dataSource": dataSource,
            "database": database,
            "collection": "vehicles",
            "filter": {
              "Item Visibility": true,
            },
          },
        ),
      );
      if (responseVehicles.statusCode == 200) {
        List<dynamic> documents = responseVehicles.data['documents'];
        documents.forEach(
          (doc) {
            items.add(Vehicle.fromJson(doc));
          },
        );
      }
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
    return items;
  }

  @override
  Future<List<Item>> getPrivateLessons() async {
    List<Item> items = [];

    try {
      var responsePrivateLessons = await dio.post(
        "$endpoint/action/find",
        options: Options(headers: headers),
        data: jsonEncode(
          {
            "dataSource": dataSource,
            "database": database,
            "collection": "privateLessons",
            "filter": {
              "Item Visibility": true,
            },
          },
        ),
      );
      if (responsePrivateLessons.statusCode == 200) {
        List<dynamic> documents = responsePrivateLessons.data['documents'];
        documents.forEach(
          (doc) {
            items.add(PrivateLesson.fromJson(doc));
          },
        );
      }
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
    return items;
  }

  @override
  Future<void> addItem(Item item) async {
    try {
      var response = await dio.post(
        "$endpoint/action/insertOne",
        options: Options(headers: headers),
        data: jsonEncode(
          {
            "dataSource": dataSource,
            "database": database,
            "collection": getCollectionType(item),
            "document": item.toJson(),
          },
        ),
      );

      if (response.statusCode == 201) {
        print('Item added successfully.');
      } else {
        throw Exception('Error adding item: ${response.data}');
      }
    } catch (e) {
      print('Error adding item: $e');
      rethrow;
    }
  }

  @override
  Future<void> deleteItem(Item item) async {
    try {
      var response = await dio.post(
        "$endpoint/action/deleteOne",
        options: Options(headers: headers),
        data: jsonEncode(
          {
            "dataSource": dataSource,
            "database": database,
            "collection": getCollectionType(item),
            "filter": {
              "_id": {"\$oid": item.id}
            },
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Deletion of item has been successful.');
      } else {
        throw Exception('Error deleting item: ${response.data}');
      }
    } catch (e) {
      print('Error deleting item: $e');
      rethrow;
    }
  }

  Future<void> updateItem() async {}
}
