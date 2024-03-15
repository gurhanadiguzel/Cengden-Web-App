import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:web_app/src/app/constants.dart';
import 'package:web_app/src/app/pages/home/home_controller.dart';
import 'package:web_app/src/app/widgets/app_bar.dart';
import 'package:web_app/src/app/widgets/app_drawer.dart';
import 'package:web_app/src/domain/entities/item.dart';

class HomeView extends View {
  @override
  State<StatefulWidget> createState() {
    return _HomeViewState(
      HomeController(),
    );
  }
}

class _HomeViewState extends ViewState<HomeView, HomeController> {
  _HomeViewState(super.controller);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget get view {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu_rounded,
              size: 40,
            ),
            onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          ),
        ),
        toolbarHeight: 100,
        title: const CengdenAppBar(),
        iconTheme: IconThemeData(color: kPrimaryColor),
      ),
      body: ControlledWidgetBuilder<HomeController>(
        builder: (context, controller) {
          return Container(
            padding: EdgeInsets.all(20),
            height: 150,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      for (Item item in controller.items) Text(item.title),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
