import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:web_app/src/app/constants.dart';
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
  Future<User> getUser() async {
    if (user != null) return user!;

    return user!;
  }

  @override
  Future<void> logIn(String email, String password) async {}

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
      print(response);
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
}
