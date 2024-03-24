import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:web_app/src/domain/entities/user.dart';
import 'package:web_app/src/domain/repositories/user_repository.dart';

class UpdateUserController extends Controller {
  UpdateUserController(
    UserRepository userRepository,
    this.user,
  ) : _userRepository = userRepository;

  final UserRepository _userRepository;
  User user;
  String? username;
  String? phoneNumber;
  String? password;
  String? passwordAgain;
  bool isLoading = false;
  bool isUpdateValid = false;
  bool? isPasswordsMatch;

  @override
  void initListeners() {}
  void updateUser(BuildContext context) async {
    isLoading = true;

    if (password != passwordAgain) {
      isUpdateValid = false;
      isPasswordsMatch = false;
      isLoading = false;
      refreshUI();
      return;
    }
    try {
      isUpdateValid = true;
      if (password != null) {
        String hashedPassword = sha256.convert(utf8.encode(password!)).toString();
        user.password = hashedPassword;
      }
      await _userRepository.updateUser(user);
    } catch (e) {
      print(e);
      rethrow;
    }
    isLoading = false;
    refreshUI();
  }

  void setUsername(String? value) {
    user.username = value ?? user.username;
    refreshUI();
  }

  void setPhoneNumber(String? value) {
    user.phoneNumber = value ?? user.phoneNumber;
    refreshUI();
  }

  void setPassword(String? value) {
    isPasswordsMatch = null;
    password = value;
    refreshUI();
  }

  void setPasswordAgain(String? value) {
    isPasswordsMatch = null;
    passwordAgain = value;
    refreshUI();
  }

  bool isFieldsAreInitializedForUpdate() {
    return username != '' && password != '' && passwordAgain != '' && phoneNumber != '';
  }
}
