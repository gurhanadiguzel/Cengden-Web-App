import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:web_app/src/app/constants.dart';
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
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Username: ${controller.user?.username ?? ''}'),
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text('Email: ${controller.user?.email ?? ''}'),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('Phone: ${controller.user?.phoneNumber ?? ''}'),
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
        );
      },
    );
  }
}
