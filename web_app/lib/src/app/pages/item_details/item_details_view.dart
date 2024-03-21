import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:web_app/src/app/constants.dart';
import 'package:web_app/src/app/navigator.dart';
import 'package:web_app/src/app/pages/item_details/item_details_controller.dart';
import 'package:web_app/src/app/widgets/app_bar.dart';
import 'package:web_app/src/app/widgets/app_drawer.dart';
import 'package:web_app/src/app/widgets/item_fields_view_widgets.dart';
import 'package:web_app/src/data/repositories/data_item_repository.dart';
import 'package:web_app/src/data/repositories/data_user_repository.dart';
import 'package:web_app/src/domain/entities/computer.dart';
import 'package:web_app/src/domain/entities/item.dart';
import 'package:web_app/src/domain/entities/phone.dart';
import 'package:web_app/src/domain/entities/private_lesson.dart';
import 'package:web_app/src/domain/entities/user.dart';
import 'package:web_app/src/domain/entities/vehicle.dart';

class ItemDetailsView extends View {
  final Item item;

  ItemDetailsView(this.item);

  @override
  State<StatefulWidget> createState() {
    return _ItemDetailsState(
      ItemDetailsController(
        DataItemRepository(),
        DataUserRepository(),
      ),
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
    return ControlledWidgetBuilder<ItemDetailsController>(
      builder: (context, controller) {
        User? user = controller.userRepository.getUser();

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
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left side with image
                Column(
                  children: [
                    Container(
                      width: size.width / 3,
                      margin: EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          item.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    (user != null && (user.auth == 'admin' || item.createdBy.id == user.id))
                        ? Container(
                            width: size.width / 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    CengdenNavigator.navigateToUpdateItemView(context, item);
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    controller.deleteItem(item);
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  ],
                ),
                // Right side with details
                item is Computer
                    ? ComputerView(computer: item as Computer)
                    : item is Phone
                        ? PhoneView(phone: item as Phone)
                        : item is Vehicle
                            ? VehicleView(vehicle: item as Vehicle)
                            : PrivateLessonView(privateLesson: item as PrivateLesson),
              ],
            ),
          ),
        );
      },
    );
  }
}
