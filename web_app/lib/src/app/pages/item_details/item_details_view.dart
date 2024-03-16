import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:web_app/src/app/constants.dart';
import 'package:web_app/src/app/pages/item_details/item_details_controller.dart';
import 'package:web_app/src/app/widgets/app_bar.dart';
import 'package:web_app/src/app/widgets/app_drawer.dart';
import 'package:web_app/src/app/widgets/item_widgets.dart';
import 'package:web_app/src/domain/entities/computer.dart';
import 'package:web_app/src/domain/entities/item.dart';
import 'package:web_app/src/domain/entities/phone.dart';
import 'package:web_app/src/domain/entities/private_lesson.dart';
import 'package:web_app/src/domain/entities/vehicle.dart';

class ItemDetailsView extends View {
  final Item item;

  ItemDetailsView(this.item);

  @override
  State<StatefulWidget> createState() {
    return _ItemDetailsState(
      ItemDetailsController(),
      item,
    );
  }
}

class _ItemDetailsState extends ViewState<ItemDetailsView, ItemDetailsController> {
  final Item item;

  _ItemDetailsState(
    ItemDetailsController controller,
    this.item,
  ) : super(controller);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(),
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
      body: item is Computer
          ? ComputerView(computer: item as Computer)
          : item is Phone
              ? PhoneView(phone: item as Phone)
              : item is Vehicle
                  ? VehicleView(vehicle: item as Vehicle)
                  : PrivateLessonView(privateLesson: item as PrivateLesson),
    );
  }
}
