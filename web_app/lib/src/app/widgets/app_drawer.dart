import 'package:flutter/material.dart';
import 'package:web_app/src/app/navigator.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Drawer(
      backgroundColor: Colors.white,
      child: Container(
        height: size.height * 0.16,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Custom Drawer Header
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 50,
                horizontal: 20,
              ),
              child: Image.asset(
                'images/cengden.png',
              ),
            ),
            // Menu Items
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.home_outlined),
                  SizedBox(width: 5),
                  Text('Home'),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                CengdenNavigator.navigateToHomeView(context);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.computer_outlined),
                  SizedBox(width: 5),
                  Text('Computers'),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.phone_iphone_outlined),
                  SizedBox(width: 5),
                  Text('Phones'),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.car_crash_outlined),
                  SizedBox(width: 5),
                  Text('Vehicles'),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.menu_book_outlined),
                  SizedBox(width: 5),
                  Text('Private Lessons'),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.account_circle_outlined),
                  SizedBox(width: 5),
                  Text('Profile'),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                CengdenNavigator.navigateToRegisterView(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
