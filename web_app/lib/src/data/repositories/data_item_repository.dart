import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:web_app/src/domain/entities/computer.dart';
import 'package:web_app/src/domain/entities/item.dart';
import 'package:web_app/src/domain/entities/phone.dart';
import 'package:web_app/src/domain/entities/private_lesson.dart';
import 'package:web_app/src/domain/entities/vehicle.dart';
import 'package:web_app/src/domain/repositories/item_repository.dart';

class DataItemRepository implements ItemRepository {
  String? _accessToken = '';

  final String _dataSource = "Cluster0";
  final String _database = "cengden";
  final String _endpoint = "https://eu-central-1.aws.data.mongodb-api.com/app/data-tbzss/endpoint/data/v1";

  Future<void> getAccessToken() async {
    String appId = 'data-tbzss';
    String url = 'https://services.cloud.mongodb.com/api/client/v2.0/app/$appId/auth/providers/anon-user/login';

    try {
      https.Response response = await https.post(Uri.parse(url));
      Map<String, dynamic> decodedBody = json.decode(response.body);
      _accessToken = decodedBody['access_token'];
    } catch (e, st) {
      print('Error making POST request: $e');
      print(st);
      rethrow;
    }
  }

  @override
  Future<List<Item>> getItems() async {
    List<Item> items = [];

    try {
      var headers = {
        "content-type": "application/json",
        "Authorization": 'Bearer $_accessToken',
      };

      https.Response responseComputers = await https.post(
        Uri.parse("$_endpoint/action/find"),
        headers: headers,
        body: jsonEncode(
          {
            "dataSource": _dataSource,
            "database": _database,
            "collection": "computers",
            "filter": {},
          },
        ),
      );
      https.Response responsePhones = await https.post(
        Uri.parse("$_endpoint/action/find"),
        headers: headers,
        body: jsonEncode(
          {
            "dataSource": _dataSource,
            "database": _database,
            "collection": "phones",
            "filter": {},
          },
        ),
      );
      https.Response responseVehicles = await https.post(
        Uri.parse("$_endpoint/action/find"),
        headers: headers,
        body: jsonEncode(
          {
            "dataSource": _dataSource,
            "database": _database,
            "collection": "vehicles",
            "filter": {},
          },
        ),
      );
      https.Response responsePrivateLessons = await https.post(
        Uri.parse("$_endpoint/action/find"),
        headers: headers,
        body: jsonEncode(
          {
            "dataSource": _dataSource,
            "database": _database,
            "collection": "privateLessons",
            "filter": {},
          },
        ),
      );

      if (responseComputers.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(responseComputers.body);

        List<dynamic> documents = json['documents'];
        documents.forEach((doc) {
          items.add(Computer.fromJson(doc));
        });

        json = jsonDecode(responsePhones.body);
        documents = json['documents'];
        documents.forEach((doc) {
          items.add(Phone.fromJson(doc));
        });

        json = jsonDecode(responsePrivateLessons.body);
        documents = json['documents'];
        documents.forEach((doc) {
          items.add(PrivateLesson.fromJson(doc));
        });

        json = jsonDecode(responseVehicles.body);
        documents = json['documents'];
        documents.forEach((doc) {
          items.add(Vehicle.fromJson(doc));
        });
      } else {
        throw Exception('Error getting items $responseComputers.statusCode');
      }
      return items;
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }
}
