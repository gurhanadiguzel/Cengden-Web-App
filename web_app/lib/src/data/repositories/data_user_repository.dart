import 'dart:convert';

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
  User? getUser() {
    return user;
  }

  @override
  Future<void> logIn(String email, String password) async {
    try {
      var response = await dio.post(
        "$endpoint/action/find",
        options: Options(headers: headers),
        data: jsonEncode({
          "dataSource": dataSource,
          "database": database,
          "collection": 'users',
          "filter": {
            "email": email,
            "password": password,
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
        logIn(user.email, user.password);

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
}
