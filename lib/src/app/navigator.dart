import 'package:flutter/material.dart';
import 'package:web_app/src/app/pages/add_item/add_item_view.dart';
import 'package:web_app/src/app/pages/home/home_view.dart';
import 'package:web_app/src/app/pages/item_details/item_details_view.dart';
import 'package:web_app/src/app/pages/profile/profile_view.dart';
import 'package:web_app/src/app/pages/register/register_view.dart';
import 'package:web_app/src/app/pages/update_item/update_item_view.dart';
import 'package:web_app/src/app/pages/update_user/update_user_view.dart';
import 'package:web_app/src/app/pages/users/users_view.dart';
import 'package:web_app/src/domain/entities/item.dart';
import 'package:web_app/src/domain/entities/user.dart';

class CengdenNavigator {
  static Future<void> navigateToHomeView(BuildContext context, String filter) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeView(filter),
      ),
    );
  }

  static Future<void> navigateToRegisterView(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterView(),
      ),
    );
  }

  static Future<void> navigateToProfileView(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileView(),
      ),
    );
  }

  static Future<void> navigateToItemDetailsView(BuildContext context, Item item) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ItemDetailsView(item),
      ),
    );
  }

  static Future<void> navigateToAddItemView(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddItemView(),
      ),
    );
  }

  static Future<void> navigateToUpdateItemView(BuildContext context, Item item) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpdateItemView(item),
      ),
    );
  }

  static Future<void> navigateToUsersView(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UsersView(),
      ),
    );
  }

  static Future<void> navigateToUpdateUserView(BuildContext context, User user) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpdateUserView(user),
      ),
    );
  }
}
