import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:web_app/src/app/constants.dart';
import 'package:web_app/src/app/navigator.dart';
import 'package:web_app/src/app/pages/update_item/update_item_controller.dart';
import 'package:web_app/src/app/widgets/cengden_text_field.dart';
import 'package:web_app/src/app/widgets/item_fields_update_widgets.dart';
import 'package:web_app/src/data/repositories/data_item_repository.dart';
import 'package:web_app/src/data/repositories/data_user_repository.dart';
import 'package:web_app/src/domain/entities/computer.dart';
import 'package:web_app/src/domain/entities/item.dart';
import 'package:web_app/src/domain/entities/phone.dart';
import 'package:web_app/src/domain/entities/private_lesson.dart';
import 'package:web_app/src/domain/entities/vehicle.dart';

class UpdateItemView extends View {
  final Item item;

  const UpdateItemView(this.item);

  @override
  State<StatefulWidget> createState() {
    return _UpdateItemViewState(
      UpdateItemController(
        DataItemRepository(),
        DataUserRepository(),
        item,
      ),
    );
  }
}

class _UpdateItemViewState extends ViewState<UpdateItemView, UpdateItemController> {
  _UpdateItemViewState(
    UpdateItemController controller,
  ) : super(controller);

  @override
  Widget get view {
    return ControlledWidgetBuilder<UpdateItemController>(
      builder: (context, controller) {
        Size size = MediaQuery.of(context).size;

        return Scaffold(
          appBar: AppBar(
            title: Text('Update Item'),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left side with image
                  Container(
                    width: size.width / 3,
                    margin: EdgeInsets.only(top: 20),
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
                        controller.item.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Right side with details
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CengdenTextField(
                          size: size * 2,
                          title: "",
                          hintText: "Title",
                          isObscure: false,
                          onChanged: controller.setTitle,
                          initialValue: controller.item.title,
                        ),
                        SizedBox(height: 20.0),
                        CengdenTextField(
                          size: size * 2,
                          title: "",
                          hintText: "Price",
                          isObscure: false,
                          onChanged: controller.setPrice,
                          initialValue: controller.item.price,
                        ),
                        SizedBox(height: 20.0),
                        CengdenTextField(
                          size: size * 2,
                          title: "",
                          hintText: "Image URL",
                          isObscure: false,
                          onChanged: controller.setImageUrl,
                          initialValue: controller.item.imageUrl,
                        ),
                        SizedBox(height: 20.0),
                        CengdenTextField(
                          size: size * 2,
                          title: "",
                          hintText: "Description",
                          isObscure: false,
                          onChanged: controller.setDescription,
                          initialValue: controller.item.description,
                        ),
                        controller.item is Computer
                            ? ComputerFieldsWidget(
                                controller: controller,
                                computer: controller.item as Computer,
                              )
                            : controller.item is Phone
                                ? PhoneFieldsWidget(
                                    controller: controller,
                                    phone: controller.item as Phone,
                                  )
                                : controller.item is Vehicle
                                    ? VehicleFieldsWidget(
                                        controller: controller,
                                        vehicle: controller.item as Vehicle,
                                      )
                                    : controller.item is PrivateLesson
                                        ? PrivateLessonFieldsWidget(
                                            controller: controller,
                                            privateLesson: controller.item as PrivateLesson,
                                          )
                                        : const SizedBox(),
                        SizedBox(height: 20),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Contact Details Display",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                height: 25,
                                width: 50,
                                child: Switch(
                                  trackOutlineColor:
                                      MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                                    return kWhite;
                                  }),
                                  thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                    return kWhite;
                                  }),
                                  activeColor: kPrimaryColor,
                                  inactiveTrackColor: kDeactiveColor,
                                  value: controller.item.isDetailsDisplayed,
                                  onChanged: controller.toggleDetailsDisplay,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Item Visibility",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                height: 25,
                                width: 50,
                                child: Switch(
                                  trackOutlineColor:
                                      MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                                    return kWhite;
                                  }),
                                  thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                    return kWhite;
                                  }),
                                  activeColor: kPrimaryColor,
                                  inactiveTrackColor: kDeactiveColor,
                                  value: controller.item.isVisible,
                                  onChanged: controller.toggleVisible,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.updateItem();
              CengdenNavigator.navigateToItemDetailsView(context, controller.item);
            },
            child: Container(
              width: 100,
              height: 100,
              child: Icon(
                Icons.check_circle_outline_outlined,
                size: 50,
              ),
            ),
          ),
        );
      },
    );
  }
}
