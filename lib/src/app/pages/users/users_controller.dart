import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:web_app/src/domain/entities/user.dart';
import 'package:web_app/src/domain/repositories/user_repository.dart';

class UsersController extends Controller {
  UsersController(
    UserRepository userRepository,
  ) : _userRepository = userRepository;
  UserRepository _userRepository;

  bool isGetUsersFetched = false;
  List<User>? users;

  @override
  void initListeners() {}

  @override
  void onInitState() {
    super.onInitState();
    getUsers();
  }

  void getUsers() async {
    users = await _userRepository.getAllUsers();
    isGetUsersFetched = true;
    refreshUI();
  }

  void deleteUser(String userId) async {
    await _userRepository.deleteUser(userId);
    users!.removeWhere((user) => user.id == userId);
    refreshUI();
  }
}
