import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Container(
        height: 300,
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
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Computers'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Phones'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Vehicles'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Private Lessons'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
