import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as https;
import 'package:web_app/src/app/constants.dart';
import 'package:web_app/src/domain/entities/item.dart';
import 'package:web_app/src/domain/entities/user.dart';
import 'package:web_app/src/domain/repositories/item_repository.dart';

class DataItemRepository implements ItemRepository {
  final dio = Dio();

  Future<void> getAccessToken() async {
    String appId = 'data-tbzss';
    String url = 'https://services.cloud.mongodb.com/api/client/v2.0/app/$appId/auth/providers/anon-user/login';

    try {
      var response = await dio.post(url);
      accessToken = response.data['access_token'];
    } catch (e, st) {
      print('Error getting Access Token request: $e');
      print(st);
      rethrow;
    }
  }

  @override
  Future<List<Item>?> getItems(String? category, int limit, int skip) async {
    List<Item> items = [];
    try {
      var response = await dio.post(
        "$endpoint/action/find",
        options: Options(headers: headers),
        data: jsonEncode(
          {
            "dataSource": dataSource,
            "database": database,
            "collection": "items",
            "filter": <String, dynamic>{
              "Item Visibility": true,
              if (category != null) "Category": category,
            },
            "limit": limit,
            "skip": skip,
          },
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> documents = response.data['documents'];
        for (var doc in documents) {
          items.add(Item.fromJson(doc));
        }
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
            "collection": 'items',
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
            "collection": 'items',
            "filter": {
              "_id": {"\$oid": item.id}
            },
          },
        ),
      );

      response = await dio.post(
        "$endpoint/action/deleteOne",
        options: Options(headers: headers),
        data: jsonEncode(
          {
            "dataSource": dataSource,
            "database": database,
            "collection": 'favoriteItems',
            "filter": {
              "Item._id": {"\$oid": item.id},
            },
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Item deleted successfully.');
        return response.data;
      } else {
        throw Exception('Error deleting item: ${response.data}');
      }
    } catch (e) {
      print('Error deleting item: $e');
      rethrow;
    }
  }

  @override
  Future<void> updateItem(Item item) async {
    try {
      var response = await dio.post(
        "$endpoint/action/updateOne",
        options: Options(headers: headers),
        data: jsonEncode(
          {
            "dataSource": dataSource,
            "database": database,
            "collection": 'items',
            "filter": {
              "_id": {"\$oid": item.id}
            },
            "update": {"\$set": item.toJson()}
          },
        ),
      );

      response = await dio.post(
        "$endpoint/action/updateMany",
        options: Options(headers: headers),
        data: jsonEncode(
          {
            "dataSource": dataSource,
            "database": database,
            "collection": 'favoriteItems',
            "filter": {
              "Item._id": {"\$oid": item.id},
            },
            "update": {
              "\$set": {
                "Item": item.toJson(),
              }
            }
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Item updated successfully.');
        return response.data;
      } else {
        throw Exception('Error updating item: ${response.data}');
      }
    } catch (e) {
      print('Error updating item: $e');
      rethrow;
    }
  }

  @override
  Future<List<Item>?> getMyItems(User user, int limit, int skip) async {
    List<Item> items = [];

    try {
      var response = await dio.post(
        "$endpoint/action/find",
        options: Options(headers: headers),
        data: jsonEncode(
          {
            "dataSource": dataSource,
            "database": database,
            "collection": "items",
            "filter": {
              "Created By._id": {"\$oid": user.id},
            },
            "limit": limit,
            "skip": skip,
          },
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> documents = response.data['documents'];
        for (var doc in documents) {
          items.add(Item.fromJson(doc));
        }
      }
    } catch (e) {
      print('Error getting favorite items: $e');
      rethrow;
    }
    return items;
  }

  @override
  Future<List<Item>?> getFavoriteItems(User user, int limit, int skip) async {
    List<Item> items = [];

    try {
      var response = await dio.post(
        "$endpoint/action/find",
        options: Options(headers: headers),
        data: jsonEncode(
          {
            "dataSource": dataSource,
            "database": database,
            "collection": "favoriteItems",
            "filter": {
              "User._id": {"\$oid": user.id},
              "Item.Item Visibility": true
            },
            "limit": limit,
            "skip": skip,
          },
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> documents = response.data['documents'];
        for (var doc in documents) {
          items.add(Item.fromJson(doc['Item']));
        }
      }
    } catch (e) {
      print('Error getting favorite items: $e');
      rethrow;
    }
    return items;
  }

  @override
  Future<void> addItemToFavorites(User user, Item item) async {
    try {
      var existingResponse = await dio.post(
        "$endpoint/action/find",
        options: Options(headers: headers),
        data: jsonEncode(
          {
            "dataSource": dataSource,
            "database": database,
            "collection": 'favoriteItems',
            "filter": {
              "User._id": {"\$oid": user.id},
              "Item._id": {"\$oid": item.id}
            },
          },
        ),
      );

      if (existingResponse.statusCode == 200) {
        List<dynamic> existingDocuments = existingResponse.data['documents'];
        if (existingDocuments.isNotEmpty) {
          print('User and item combination already exists in favorites.');
          return;
        }
      } else {
        throw Exception('Error checking for existing favorites: ${existingResponse.data}');
      }

      var response = await dio.post(
        "$endpoint/action/insertOne",
        options: Options(headers: headers),
        data: jsonEncode(
          {
            "dataSource": dataSource,
            "database": database,
            "collection": 'favoriteItems',
            "document": {
              "User": user.toJson(),
              "Item": item.toJson(),
              "createdAt": DateTime.now().toString(),
              "priceAtAddition": item.price // Optionally include the price at the time of addition
            },
          },
        ),
      );

      if (response.statusCode == 201) {
        print('Item added to favorites successfully.');
      } else {
        throw Exception('Error adding item to favorites: ${response.data}');
      }
    } catch (e) {
      print('Error adding item to favorites: $e');
      rethrow;
    }
  }

  @override
  Future<void> deleteItemFromFavorites(User user, Item item) async {
    try {
      var response = await dio.post(
        "$endpoint/action/deleteOne",
        options: Options(headers: headers),
        data: jsonEncode(
          {
            "dataSource": dataSource,
            "database": database,
            "collection": 'favoriteItems',
            "filter": {
              "User._id": {"\$oid": user.id},
              "Item._id": {"\$oid": item.id}
            }
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Item deleted from favorites successfully.');
      } else {
        throw Exception('Error deleting item from favorites: ${response.data}');
      }
    } catch (e) {
      print('Error deleting item from favorites: $e');
      rethrow;
    }
  }

  @override
  Future<void> sendUpdatedPriceMail(Item item, String? previousPrice, String? newPrice) async {
    try {
      var response = await dio.post(
        "$endpoint/action/find",
        options: Options(headers: headers),
        data: json.encode(
          {
            "dataSource": dataSource,
            "database": database,
            "collection": 'favoriteItems',
            "filter": {
              "Item._id": {"\$oid": item.id},
            },
          },
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> documents = response.data['documents'];
        List<String> userEmails = documents.map((doc) => doc['User']['email'].toString()).toList();
        for (String email in userEmails) {
          var emailResponse = await https.post(
            Uri.parse('https://j5eqvzn2agxc45u3jiyvnzuhfa0rsxvb.lambda-url.eu-north-1.on.aws/'),
            body: json.encode(
              {
                "previousPrice": previousPrice,
                "newPrice": newPrice,
                "email": email,
              },
            ),
          );
          if (emailResponse.statusCode == 200) {
            print('Email sent to $email');
          } else {
            print('Failed to send email to $email: ${emailResponse.reasonPhrase}');
          }
        }
      } else {
        print('Failed to fetch user documents: ${response.data}');
      }
    } catch (e) {
      print('Error making POST request: $e');
    }
  }
}
