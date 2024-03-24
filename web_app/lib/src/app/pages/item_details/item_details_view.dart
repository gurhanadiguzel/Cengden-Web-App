import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:web_app/src/app/navigator.dart';
import 'package:web_app/src/app/pages/item_details/item_details_controller.dart';
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
        User? user = controller.userRepository.getCurrentUser();

        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(
              'Item Details',
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left side with image
                Column(
                  children: [
                    Container(
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
                          width: size.width / 4,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (user != null)
                            IconButton(
                              onPressed: () {
                                controller.addItemToFavorites(item);
                              },
                              icon: Icon(
                                Icons.bookmark_add_outlined,
                                size: 32,
                                color: Colors.blue, // Adjust color to match your theme
                              ),
                            ),
                          SizedBox(width: 20),
                          if (user != null && (user.auth == 'admin' || item.createdBy.id == user.id))
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    CengdenNavigator.navigateToUpdateItemView(context, item);
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    size: 32,
                                    color: Colors.green, // Adjust color to match your theme
                                  ),
                                ),
                                SizedBox(width: 20),
                                IconButton(
                                  onPressed: () {
                                    controller.deleteItem(item);
                                    CengdenNavigator.navigateToHomeView(context, 'no');
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    size: 32,
                                    color: Colors.red, // Adjust color to match your theme
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(width: 100),
                // Right side with details
                Container(
                  //width: size.width * 0.5,
                  child: item is Computer
                      ? ComputerView(
                          computer: item as Computer,
                          user: user,
                        )
                      : item is Phone
                          ? PhoneView(
                              phone: item as Phone,
                              user: user,
                            )
                          : item is Vehicle
                              ? VehicleView(
                                  vehicle: item as Vehicle,
                                  user: user,
                                )
                              : PrivateLessonView(
                                  privateLesson: item as PrivateLesson,
                                  user: user,
                                ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
