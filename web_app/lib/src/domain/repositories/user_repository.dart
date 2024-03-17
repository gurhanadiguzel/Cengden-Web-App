import 'package:web_app/src/domain/entities/user.dart';

abstract class UserRepository {
  Future<void> signUp(User user);
  Future<void> logIn(String email, String password);
  Future<bool?> getIfEmailAvaliableForRegister();
  Future<User> getUser();
}
