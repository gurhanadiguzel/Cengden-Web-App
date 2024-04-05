import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:web_app/src/app/navigator.dart';
import 'package:web_app/src/data/exceptions/invalid_login_exception.dart';
import 'package:web_app/src/domain/entities/user.dart';
import 'package:web_app/src/domain/repositories/user_repository.dart';

class RegisterController extends Controller {
  RegisterController(
    UserRepository userRepository,
  ) : userRepository = userRepository;

  UserRepository userRepository;

  User? user;

  String username = '';
  String emailLogin = '';
  String passwordLogin = '';
  String email = '';
  String password = '';
  String passwordAgain = '';
  String phoneNumber = '';
  String userVerificationCode = '';
  bool termsAndPrivacyAccepted = false;

  bool isLoading = false;
  bool? isLoginValid;
  bool? isEmailValid;
  bool isRegisterValid = false;
  bool? isUsernameAvaliable;
  bool? isPasswordsMatch;

  String? verifiedCode;

  @override
  void initListeners() {}

  void setEmailLogin(String value) {
    emailLogin = value;
    isLoginValid = null;
    refreshUI();
  }

  void setPasswordLogin(String value) {
    passwordLogin = value;
    isLoginValid = null;
    refreshUI();
  }

  void setUsername(String value) {
    isUsernameAvaliable = null;
    username = value;
    refreshUI();
  }

  void setEmail(String value) {
    isEmailValid = null;
    email = value;
    refreshUI();
  }

  void setPassword(String value) {
    isPasswordsMatch = null;
    password = value;
    refreshUI();
  }

  void setPasswordAgain(String value) {
    isPasswordsMatch = null;
    passwordAgain = value;
    refreshUI();
  }

  void setPhoneNumber(String value) {
    phoneNumber = value;
    refreshUI();
  }

  void setUserVerificationCode(String value) {
    userVerificationCode = value;
    refreshUI();
  }

  bool isFieldsAreInitializedForLogin() {
    return emailLogin != '' && passwordLogin != '';
  }

  bool isFieldsAreInitializedForRegister() {
    return email != '' &&
        password != '' &&
        username != '' &&
        passwordAgain != '' &&
        phoneNumber != '' &&
        termsAndPrivacyAccepted;
  }

  void toggleTermsAndPolicy() {
    termsAndPrivacyAccepted = !termsAndPrivacyAccepted;
    refreshUI();
  }

  void logIn(BuildContext context) async {
    isLoading = true;
    refreshUI();
    try {
      await userRepository.logIn(emailLogin, passwordLogin);
    } catch (e) {
      if (e is InvalidLoginException) {
        isLoginValid = false;
      }
    }
    isLoading = false;

    if (isLoginValid == false) {
      isLoading = false;
      refreshUI();
      return;
    } else {
      CengdenNavigator.navigateToHomeView(context, 'no');
    }
  }

  void verifyCode(BuildContext context) async {
    isLoading = true;
    refreshUI();

    if (!isValidEmail(email)) {
      isRegisterValid = false;
      isEmailValid = false;
      isLoading = false;
      refreshUI();
      return;
    }

    if (password != passwordAgain) {
      isRegisterValid = false;
      isPasswordsMatch = false;
      isLoading = false;
      refreshUI();
      return;
    }

    try {
      generateSixDigitCode();
      isRegisterValid = true;
      await userRepository.sendVerificationCode(verifiedCode!, email);
    } catch (e) {
      print(e);
      rethrow;
    }
    isLoading = false;
    refreshUI();
  }

  void signUp(BuildContext context) async {
    user = User(
      id: '',
      username: username,
      email: email,
      password: sha256.convert(utf8.encode(password)).toString(),
      phoneNumber: phoneNumber,
      auth: 'user',
    );
    try {
      if (userVerificationCode == verifiedCode) {
        print("Code is correct");
        await userRepository.signUp(user!);
        await userRepository.logIn(email, password);
        Navigator.of(context).pop();
        CengdenNavigator.navigateToHomeView(context, 'no');
        refreshUI();
      } else {
        print("Code is wrong");
      }
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  bool isValidEmail(String email) {
    if (email.endsWith('@ceng.metu.edu.tr')) return true;
    return false;
  }

  void generateSixDigitCode() {
    Random random = Random();
    int min = 100000;
    int max = 999999;
    int code = min + random.nextInt(max - min);
    verifiedCode = code.toString();
  }
}
