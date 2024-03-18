import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:web_app/src/app/navigator.dart';
import 'package:web_app/src/domain/entities/user.dart';
import 'package:web_app/src/domain/repositories/user_repository.dart';

class ProfileController extends Controller {
  ProfileController(
    UserRepository userRepository,
  ) : userRepository = userRepository;

  UserRepository userRepository;

  User? user;
  bool isLoading = false;

  @override
  void initListeners() {}
  @override
  void onInitState() async {
    super.onInitState();
    user = userRepository.getUser();
  }

  void logOut(BuildContext context) async {
    isLoading = true;
    try {
      userRepository.logOut();
      isLoading = false;
      CengdenNavigator.navigateToHomeView(context, 'no');
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }
}
