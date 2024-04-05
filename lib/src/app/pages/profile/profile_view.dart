import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:web_app/src/app/constants.dart';
import 'package:web_app/src/app/navigator.dart';
import 'package:web_app/src/app/pages/profile/profile_controller.dart';
import 'package:web_app/src/app/widgets/app_bar.dart';
import 'package:web_app/src/app/widgets/app_drawer.dart';
import 'package:web_app/src/app/widgets/primary_button.dart';
import 'package:web_app/src/data/repositories/data_user_repository.dart';

class ProfileView extends View {
  @override
  State<StatefulWidget> createState() {
    return _ProfileViewState(
      ProfileController(
        DataUserRepository(),
      ),
    );
  }
}

class _ProfileViewState extends ViewState<ProfileView, ProfileController> {
  _ProfileViewState(super.controller);

  @override
  Widget get view {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    Size size = MediaQuery.of(context).size;
    return ControlledWidgetBuilder<ProfileController>(
      builder: (context, controller) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: AppDrawer(
            userRepository: controller.userRepository,
          ),
          appBar: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.menu_rounded,
                  size: 32,
                ),
                onPressed: () => _scaffoldKey.currentState!.openDrawer(),
              ),
            ),
            toolbarHeight: size.height * 0.12,
            title: const CengdenAppBar(),
            iconTheme: IconThemeData(color: kPrimaryColor),
          ),
          body: SingleChildScrollView(
            child: Container(
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: size.width / 4, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.grey[300],
                    child: Icon(
                      Icons.person,
                      size: 100,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          'Username: ${controller.user?.username ?? ''}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.email),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          'Email: ${controller.user?.email ?? ''}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.phone),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          'Phone: ${controller.user?.phoneNumber ?? ''}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Container(
                    width: (size.width - 40) / 4,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        CengdenNavigator.navigateToUpdateUserView(context, controller.user!);
                      },
                      child: Text(
                        'Edit Profile',
                        style: kAppBarTitleStyle(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  PrimaryButton(
                    text: "Log Out",
                    onPressed: () {
                      controller.logOut(context);
                    },
                    isEnabled: true,
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
