import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:web_app/src/app/pages/users/users_controller.dart';
import 'package:web_app/src/data/repositories/data_user_repository.dart';
import 'package:web_app/src/domain/entities/user.dart';

class UsersView extends View {
  UsersView();

  @override
  State<StatefulWidget> createState() {
    return _UsersViewState(
      UsersController(
        DataUserRepository(),
      ),
    );
  }
}

class _UsersViewState extends ViewState<UsersView, UsersController> {
  _UsersViewState(super.controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;

    return ControlledWidgetBuilder<UsersController>(
      builder: (context, controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Users'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Container(
              width: size.width,
              padding: EdgeInsets.all(20),
              child: controller.isGetUsersFetched
                  ? Column(
                      children: controller.users!.map((user) {
                        return _UserContainer(user, controller);
                      }).toList(),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ),
        );
      },
    );
  }

  Widget _UserContainer(User user, UsersController controller) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.75,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.grey[600],
              ),
            ),
          ),
          Container(
            width: size.width * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Username: ${user.username}'),
                SizedBox(height: 5),
                Text('Email: ${user.email}'),
                SizedBox(height: 5),
                Text('Phone Number: ${user.phoneNumber}'),
                SizedBox(height: 5),
                Text('Auth: ${user.auth}'),
              ],
            ),
          ),
          Container(
            child: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                controller.deleteUser(user.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
