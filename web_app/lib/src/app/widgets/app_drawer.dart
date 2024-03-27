import 'package:flutter/material.dart';
import 'package:web_app/src/app/navigator.dart';
import 'package:web_app/src/domain/entities/user.dart';
import 'package:web_app/src/domain/repositories/user_repository.dart';

class AppDrawer extends StatelessWidget {
  final UserRepository userRepository;

  AppDrawer({required this.userRepository});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    User? user = userRepository.getCurrentUser();
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
              child: Image.network(
                'https://raw.githubusercontent.com/gurhanadiguzel/Flutter-Projects/main/images/cengden.png',
                fit: BoxFit.cover,
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
                CengdenNavigator.navigateToHomeView(context, 'no');
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
                CengdenNavigator.navigateToHomeView(context, 'computers');
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
                CengdenNavigator.navigateToHomeView(context, 'phones');
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.directions_car_outlined),
                  SizedBox(width: 5),
                  Text('Vehicles'),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                CengdenNavigator.navigateToHomeView(context, 'vehicles');
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
                CengdenNavigator.navigateToHomeView(context, 'privateLessons');
              },
            ),
            user != null
                ? Column(
                    children: [
                      ListTile(
                        title: Row(
                          children: [
                            Icon(Icons.add_outlined),
                            SizedBox(width: 5),
                            Text('Add Item'),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          CengdenNavigator.navigateToAddItemView(context);
                        },
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            Icon(Icons.bookmark_outlined),
                            SizedBox(width: 5),
                            Text('Favorite Items'),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          CengdenNavigator.navigateToHomeView(context, 'favoriteItems');
                        },
                      ),
                      ListTile(
                        title: Row(
                          children: [
                            Icon(Icons.local_offer_outlined),
                            SizedBox(width: 5),
                            Text('My Items'),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          CengdenNavigator.navigateToHomeView(context, 'myItems');
                        },
                      ),
                    ],
                  )
                : Container(),
            if (user != null && user.auth == 'admin')
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.groups_outlined),
                    SizedBox(width: 5),
                    Text('All Users'),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                  CengdenNavigator.navigateToUsersView(context);
                },
              ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.account_circle_outlined),
                  SizedBox(width: 5),
                  user == null ? Text('Profile') : Text(user.username),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                user != null
                    ? CengdenNavigator.navigateToProfileView(context)
                    : CengdenNavigator.navigateToRegisterView(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
