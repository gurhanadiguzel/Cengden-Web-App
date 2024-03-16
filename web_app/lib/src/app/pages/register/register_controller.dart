import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class RegisterController extends Controller {
  String username = '';
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
  void setUsername(String value) {
    isUsernameAvaliable = null;
    this.username = value;
    refreshUI();
  }

  void setEmail(String email) {
    this.email = email;
    isEmailValid = null;
    isLoginValid = null;
    refreshUI();
  }

  void setPassword(String value) {
    passwordsMatch = null;
    this.password = value;
    isLoginValid = null;
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
    return this.email != '' && this.password != '';
  }

  bool isFieldsAreInitializedForRegister() {
    return this.email != '' && this.password != '' && this.username != '' && this.termsAndPrivacyAccepted;
  }

  void toggleTermsAndPolicy() {
    termsAndPrivacyAccepted = !termsAndPrivacyAccepted;
    refreshUI();
  }

  void logIn() {}
  void register() {}
}
