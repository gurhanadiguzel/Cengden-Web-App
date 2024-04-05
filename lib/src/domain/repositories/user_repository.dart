import 'package:web_app/src/domain/entities/user.dart';

abstract class UserRepository {
  Future<void> signUp(User user);
  Future<void> logIn(String email, String password);
  Future<void> sendVerificationCode(String verificationCode, String email);
  Future<void> deleteUser(String userId);
  Future<void> updateUser(User user);
  Future<bool?> getIfEmailAvaliableForRegister();
  Future<List<User>> getAllUsers();
  User? getCurrentUser();
  void logOut();
}
