import 'package:flutter/material.dart';
import 'package:web_app/src/app/pages/home/home_view.dart';
import 'package:web_app/src/app/pages/register/register_view.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // scaffoldBackgroundColor: kBackgroundColor,
        // colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: Scaffold(
        body: HomeView(),
      ),
    );
  }
}