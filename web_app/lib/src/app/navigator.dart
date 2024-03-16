import 'package:flutter/material.dart';
import 'package:web_app/src/app/pages/home/home_view.dart';
import 'package:web_app/src/app/pages/item_details/item_details_view.dart';
import 'package:web_app/src/app/pages/register/register_view.dart';
import 'package:web_app/src/domain/entities/item.dart';

class CengdenNavigator {
  static Future<void> navigateToHomeView(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeView(),
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

  static Future<void> navigateToItemDetailsView(BuildContext context, Item item) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ItemDetailsView(item),
      ),
    );
  }
}
