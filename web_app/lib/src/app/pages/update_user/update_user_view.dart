import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:web_app/src/app/navigator.dart';
import 'package:web_app/src/app/pages/update_user/update_user_controller.dart';
import 'package:web_app/src/app/widgets/cengden_text_field.dart';
import 'package:web_app/src/app/widgets/primary_button.dart';
import 'package:web_app/src/data/repositories/data_user_repository.dart';
import 'package:web_app/src/domain/entities/user.dart';

class UpdateUserView extends View {
  final User user;

  const UpdateUserView(this.user);

  @override
  State<StatefulWidget> createState() {
    return _UpdateUserViewState(
      UpdateUserController(
        DataUserRepository(),
        user,
      ),
    );
  }
}

class _UpdateUserViewState extends ViewState<UpdateUserView, UpdateUserController> {
  _UpdateUserViewState(
    UpdateUserController controller,
  ) : super(controller);

  @override
  Widget get view {
    return ControlledWidgetBuilder<UpdateUserController>(
      builder: (context, controller) {
        Size size = MediaQuery.of(context).size;
        return Scaffold(
          appBar: AppBar(
            title: Text('Update User'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Container(
              width: size.width,
              height: size.height,
              padding: EdgeInsets.all(100),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey[300],
                    child: Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 20),
                  CengdenTextField(
                    size: size * 2,
                    title: "",
                    hintText: "Username",
                    isObscure: false,
                    onChanged: controller.setUsername,
                    initialValue: controller.user.username,
                  ),
                  CengdenTextField(
                    size: size * 2,
                    title: "",
                    hintText: "Phone",
                    isObscure: false,
                    onChanged: controller.setPhoneNumber,
                    initialValue: controller.user.phoneNumber,
                  ),
                  CengdenTextField(
                    size: size * 2,
                    title: "",
                    hintText: "New Password",
                    isObscure: true,
                    onChanged: controller.setPassword,
                  ),
                  CengdenTextField(
                    size: size * 2,
                    title: "",
                    hintText: "New Password Again",
                    isObscure: true,
                    onChanged: controller.setPasswordAgain,
                    color: controller.isPasswordsMatch == false ? Colors.red : null,
                  ),
                  SizedBox(height: 20),
                  PrimaryButton(
                    text: "Update",
                    onPressed: () {
                      controller.updateUser(context);
                      CengdenNavigator.navigateToProfileView(context);
                    },
                    isEnabled: controller.isFieldsAreInitializedForUpdate(),
                    isLoading: controller.isLoading,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
