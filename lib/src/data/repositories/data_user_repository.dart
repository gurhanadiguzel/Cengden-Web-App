import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as https;
import 'package:web_app/src/app/constants.dart';
import 'package:web_app/src/data/exceptions/invalid_login_exception.dart';
import 'package:web_app/src/domain/entities/user.dart';
import 'package:web_app/src/domain/repositories/user_repository.dart';

class DataUserRepository implements UserRepository {
  static final _instance = DataUserRepository._internal();
  DataUserRepository._internal();
  factory DataUserRepository() => _instance;

  User? user;
  final dio = Dio();

  @override
  Future<bool?> getIfEmailAvaliableForRegister() async {
    throw UnimplementedError();
  }

  @override
  User? getCurrentUser() {
    return user;
  }

  @override
  Future<List<User>> getAllUsers() async {
    List<User> users = [];

    try {
      var response = await dio.post(
        "$endpoint/action/find",
        options: Options(headers: headers),
        data: jsonEncode({
          "dataSource": dataSource,
          "database": database,
          "collection": 'users',
          "filter": {},
        }),
      );
      if (response.statusCode == 200) {
        List<dynamic> documents = response.data['documents'];
        documents.forEach(
          (doc) {
            users.add(User.fromJson(doc));
          },
        );
      } else {
        throw Exception('Error logging in: ${response.statusCode}');
      }
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
    return users;
  }

  @override
  Future<void> logIn(String email, String password) async {
    try {
      String hashedPassword = sha256.convert(utf8.encode(password)).toString();
      var response = await dio.post(
        "$endpoint/action/find",
        options: Options(headers: headers),
        data: jsonEncode({
          "dataSource": dataSource,
          "database": database,
          "collection": 'users',
          "filter": {
            "email": email,
            "password": hashedPassword,
          },
        }),
      );
      List<dynamic> documents = response.data['documents'];
      if (response.statusCode == 200) {
        if (response.data['documents'].isEmpty) {
          throw InvalidLoginException();
        } else {
          user = User.fromJson(documents.first);
          print('User logged in successfully.');
        }
      } else {
        throw Exception('Error logging in: ${response.statusCode}');
      }
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  @override
  void logOut() {
    user = null;
    print('User logged out successfully.');
  }

  @override
  Future<void> signUp(User user) async {
    try {
      var response = await dio.post(
        "$endpoint/action/insertOne",
        options: Options(headers: headers),
        data: jsonEncode(
          {
            "dataSource": dataSource,
            "database": database,
            "collection": 'users',
            "document": user.toJson(),
          },
        ),
      );
      if (response.statusCode == 201) {
        print('User sign-up has been successful.');

        return response.data;
      } else {
        throw Exception('Error creating phone contact');
      }
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  @override
  Future<void> sendVerificationCode(String verificationCode, String email) async {
    try {
      var response = await https.post(
        Uri.parse('https://ktqvtcnare6eigpyulpecfe7ju0gtvqd.lambda-url.eu-north-1.on.aws/'),
        body: json.encode(
          {
            "verificationCode": verificationCode,
            "email": email,
          },
        ),
      );

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.body);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print('Error making POST request: $e');
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      var response = await dio.post(
        "$endpoint/action/deleteOne",
        options: Options(headers: headers),
        data: jsonEncode(
          {
            "dataSource": dataSource,
            "database": database,
            "collection": 'users',
            "filter": {
              "_id": {"\$oid": userId}
            },
          },
        ),
      );

      if (response.statusCode == 200) {
        print('User deleted successfully.');
        return response.data;
      } else {
        throw Exception('Error deleting user: ${response.data}');
      }
    } catch (e) {
      print('Error deleting user: $e');
      rethrow;
    }
  }

  Future<void> updateUser(User user) async {
    try {
      // Updates Users
      var response = await dio.post(
        "$endpoint/action/updateOne",
        options: Options(headers: headers),
        data: jsonEncode(
          {
            "dataSource": dataSource,
            "database": database,
            "collection": 'users',
            "filter": {
              "_id": {"\$oid": user.id}
            },
            "update": {"\$set": user.toJson()}
          },
        ),
      );

      // Updates Created By in the items
      response = await dio.post(
        "$endpoint/action/updateMany",
        options: Options(headers: headers),
        data: jsonEncode(
          {
            "dataSource": dataSource,
            "database": database,
            "collection": 'items',
            "filter": {
              "Created By._id": {"\$oid": user.id},
            },
            "update": {
              "\$set": {
                "Created By": user.toJson(),
              }
            }
          },
        ),
      );

      // Updates Users in the favorites
      response = await dio.post(
        "$endpoint/action/updateMany",
        options: Options(headers: headers),
        data: jsonEncode(
          {
            "dataSource": dataSource,
            "database": database,
            "collection": 'favoriteItems',
            "filter": {
              "User._id": {"\$oid": user.id},
            },
            "update": {
              "\$set": {
                "User": user.toJson(),
              }
            }
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
              "Item.Created By._id": {"\$oid": user.id},
            },
            "update": {
              "\$set": {
                "Item.Created By": user.toJson(),
              }
            }
          },
        ),
      );

      if (response.statusCode == 200) {
        print('User updated successfully.');
        return response.data;
      } else {
        throw Exception('Error updating user: ${response.data}');
      }
    } catch (e) {
      print('Error updating user: $e');
      rethrow;
    }
  }
}
