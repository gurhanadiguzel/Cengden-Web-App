import 'package:web_app/src/domain/entities/user.dart';

abstract class UserRepository {
  Future<void> signUp(User user);
  Future<void> logIn(String email, String password);
  void logOut();
  Future<bool?> getIfEmailAvaliableForRegister();
  User? getUser();
}
