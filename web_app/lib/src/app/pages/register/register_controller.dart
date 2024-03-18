import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:web_app/src/app/navigator.dart';
import 'package:web_app/src/data/exceptions/invalid_email_exception.dart';
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
  bool termsAndPrivacyAccepted = false;

  bool isLoading = false;
  bool? isLoginValid;
  bool? isEmailValid;
  bool? isEmailAvaliable;
  bool? isUsernameAvaliable;
  bool? passwordsMatch;

  @override
  void initListeners() {}

  void setEmailLogin(String value) {
    this.emailLogin = value;
    isEmailValid = null;
    isLoginValid = null;
    refreshUI();
  }

  void setPasswordLogin(String value) {
    this.passwordLogin = value;
    isLoginValid = null;
    refreshUI();
  }

  void setUsername(String value) {
    isUsernameAvaliable = null;
    this.username = value;
    refreshUI();
  }

  void setEmail(String value) {
    isEmailAvaliable = null;
    this.email = value;
    refreshUI();
  }

  void setPassword(String value) {
    passwordsMatch = null;
    this.password = value;
    refreshUI();
  }

  void setPasswordAgain(String value) {
    passwordsMatch = null;
    this.passwordAgain = value;
    refreshUI();
  }

  void setPhoneNumber(String value) {
    this.phoneNumber = value;
    refreshUI();
  }

  bool isFieldsAreInitializedForLogin() {
    return this.emailLogin != '' && this.passwordLogin != '';
  }

  bool isFieldsAreInitializedForRegister() {
    return this.email != '' && this.password != '' && this.username != '' && this.termsAndPrivacyAccepted;
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
      if (e is InvalidEmailException) {
        isEmailValid = false;
      } else if (e is InvalidLoginException) {
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

  void signUp(BuildContext context) async {
    isLoading = true;
    if (password != passwordAgain) {
      passwordsMatch = false;
      isLoading = false;
      refreshUI();
      return;
    }
    user = User(
      id: '',
      username: username,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      auth: 'user',
    );

    try {
      await userRepository.signUp(user!);
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
    if (isEmailAvaliable == false) {}
    isLoading = false;
    CengdenNavigator.navigateToHomeView(context, 'no');

    refreshUI();
  }
}
