import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:web_app/src/app/constants.dart';
import 'package:web_app/src/app/navigator.dart';
import 'package:web_app/src/app/pages/register/register_controller.dart';
import 'package:web_app/src/app/widgets/app_bar.dart';
import 'package:web_app/src/app/widgets/app_drawer.dart';
import 'package:web_app/src/app/widgets/cengden_text_field.dart';
import 'package:web_app/src/app/widgets/primary_button.dart';
import 'package:web_app/src/data/repositories/data_user_repository.dart';

class RegisterView extends View {
  @override
  State<StatefulWidget> createState() {
    return _RegisterViewState(
      RegisterController(
        DataUserRepository(),
      ),
    );
  }
}

class _RegisterViewState extends ViewState<RegisterView, RegisterController> {
  _RegisterViewState(super.controller);

  @override
  Widget get view {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu_rounded,
              size: size.width * 0.025,
            ),
            onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          ),
        ),
        toolbarHeight: size.height * 0.12,
        title: const CengdenAppBar(),
        iconTheme: IconThemeData(color: kPrimaryColor),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: ControlledWidgetBuilder<RegisterController>(
          builder: (context, controller) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: (size.width - 40) / 4,
                            child: Column(
                              children: [
                                Text(
                                  "Log in",
                                  textAlign: TextAlign.left,
                                  style: kTitleStyle(),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10),
                                  width: size.width - 60,
                                  child: Text(
                                    "Welcome back!",
                                    textAlign: TextAlign.center,
                                    style: kSubtitleStyle(),
                                  ),
                                ),
                                SizedBox(height: 50),
                                CengdenTextField(
                                  size: size,
                                  title: "Email Address",
                                  hintText: "Your email",
                                  isObscure: false,
                                  onChanged: controller.setEmail,
                                  color: (controller.isEmailValid == false || controller.isLoginValid == false)
                                      ? Colors.red
                                      : null,
                                ),
                                SizedBox(height: 20),
                                CengdenTextField(
                                  size: size,
                                  title: "Password",
                                  hintText: "Your password",
                                  isObscure: true,
                                  onChanged: controller.setPassword,
                                ),
                                SizedBox(height: 15),
                                Container(
                                  width: size.width - 40,
                                  child: Text(
                                    "Forgot password?",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 50),
                                PrimaryButton(
                                  text: "Log in",
                                  onPressedFunctions: [controller.logIn],
                                  isEnabled: controller.isFieldsAreInitializedForLogin(),
                                  isLoading: controller.isLoading,
                                ),
                                if (controller.isLoginValid == false)
                                  Text(
                                    "User information is not correct",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.red,
                                    ),
                                  ),
                                if (controller.isEmailValid == false)
                                  Text(
                                    "Email is not a valid email",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.red,
                                    ),
                                  ),
                                SizedBox(height: 40),
                              ],
                            ),
                          ),
                          Container(
                            width: 1,
                            height: size.height - 200,
                            color: kBlackHint,
                          ),
                          Container(
                            width: (size.width - 40) / 4,
                            child: Column(
                              children: [
                                Text(
                                  "Create Account",
                                  textAlign: TextAlign.center,
                                  style: kTitleStyle(),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10),
                                  width: size.width - 60,
                                  child: Text(
                                    "Welcome to Cengden. It is time to shop!",
                                    textAlign: TextAlign.center,
                                    style: kSubtitleStyle(),
                                  ),
                                ),
                                SizedBox(height: 50),
                                CengdenTextField(
                                  size: size,
                                  title: "Username",
                                  hintText: "Your username",
                                  isObscure: false,
                                  onChanged: controller.setUsername,
                                  color: controller.isUsernameAvaliable == false ? Colors.red : null,
                                ),
                                SizedBox(height: 20),
                                CengdenTextField(
                                  size: size,
                                  title: "Email",
                                  hintText: "Your email",
                                  isObscure: false,
                                  onChanged: controller.setEmail,
                                  color: controller.isEmailAvaliable == false ? Colors.red : null,
                                ),
                                SizedBox(height: 20),
                                CengdenTextField(
                                  size: size,
                                  title: "Password",
                                  hintText: "Your password",
                                  isObscure: true,
                                  onChanged: controller.setPassword,
                                ),
                                SizedBox(height: 20),
                                CengdenTextField(
                                  size: size,
                                  title: "Password Again",
                                  hintText: "Your Password",
                                  isObscure: true,
                                  onChanged: controller.setPasswordAgain,
                                  color: controller.passwordsMatch == false ? Colors.red : null,
                                ),
                                SizedBox(height: 20),
                                CengdenTextField(
                                  size: size,
                                  title: "Phone Number",
                                  hintText: "Your phone number",
                                  isObscure: false,
                                  onChanged: controller.setPhoneNumber,
                                ),
                                SizedBox(height: 20),
                                GestureDetector(
                                  onTap: controller.toggleTermsAndPolicy,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 10),
                                      Checkbox(
                                        value: controller.termsAndPrivacyAccepted,
                                        onChanged: (_) {
                                          controller.toggleTermsAndPolicy();
                                        },
                                      ),
                                      Flexible(
                                        child: Container(
                                          child: Text(
                                            "I accept the terms and privacy policy",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 40),
                                PrimaryButton(
                                  text: "Sign Up",
                                  onPressedFunctions: [
                                    controller.signUp,
                                    () => CengdenNavigator.navigateToHomeView(context, 'no'),
                                  ],
                                  isEnabled: controller.isFieldsAreInitializedForRegister(),
                                  isLoading: controller.isLoading,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
