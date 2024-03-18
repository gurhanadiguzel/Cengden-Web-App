import 'package:flutter/material.dart' hide View;
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:web_app/src/app/constants.dart';
import 'package:web_app/src/app/pages/add_item/add_item_controller.dart';
import 'package:web_app/src/app/widgets/cengden_text_field.dart';
import 'package:web_app/src/app/widgets/item_fields_widgets.dart';
import 'package:web_app/src/data/repositories/data_item_repository.dart';
import 'package:web_app/src/data/repositories/data_user_repository.dart';

class AddItemView extends View {
  @override
  State<StatefulWidget> createState() {
    return _AddItemViewState(
      AddItemController(
        DataUserRepository(),
        DataItemRepository(),
      ),
    );
  }
}

class _AddItemViewState extends ViewState<AddItemView, AddItemController> {
  _AddItemViewState(super.controller);

  @override
  Widget get view {
    return ControlledWidgetBuilder<AddItemController>(builder: (context, controller) {
      //TODO fix size
      Size size = MediaQuery.of(context).size * 2;

      return Scaffold(
        appBar: AppBar(
          title: Text('Add Item'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(50.0),
          child: Column(
            children: [
              Container(
                width: (size.width - 40) / 4,
                child: DropdownButtonFormField<String>(
                  value: controller.selectedItemType,
                  onChanged: (value) {
                    controller.setItemType(value);
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 'computer',
                      child: Text('Computer'),
                    ),
                    DropdownMenuItem(
                      value: 'phone',
                      child: Text('Phone'),
                    ),
                    DropdownMenuItem(
                      value: 'vehicle',
                      child: Text('Vehicle'),
                    ),
                    DropdownMenuItem(
                      value: 'privateLesson',
                      child: Text('Private Lesson'),
                    ),
                  ],
                  decoration: const InputDecoration(labelText: 'Select Item Type'),
                ),
              ),
              SizedBox(height: 20.0),
              CengdenTextField(
                size: size,
                title: "",
                hintText: "Title",
                isObscure: false,
                onChanged: (String value) {
                  controller.setTitle(value);
                },
              ),
              CengdenTextField(
                size: size,
                title: "",
                hintText: "Price",
                isObscure: false,
                onChanged: (String value) {
                  controller.setPrice(value);
                },
              ),
              CengdenTextField(
                size: size,
                title: "",
                hintText: "Image URL",
                isObscure: false,
                onChanged: (String value) {
                  controller.setImageUrl(value);
                },
              ),
              CengdenTextField(
                size: size,
                title: "",
                hintText: "Description",
                isObscure: false,
                onChanged: (String value) {
                  controller.setDescription(value);
                },
              ),
              controller.selectedItemType == 'computer'
                  ? ComputerFieldsWidget(controller: controller)
                  : controller.selectedItemType == 'phone'
                      ? PhoneFieldsWidget(controller: controller)
                      : controller.selectedItemType == 'vehicle'
                          ? VehicleFieldsWidget(controller: controller)
                          : controller.selectedItemType == 'privateLesson'
                              ? PrivateLessonFieldsWidget(controller: controller)
                              : const SizedBox(),
              SizedBox(height: 20.0),
              Container(
                width: (size.width - 40) / 4,
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
                        trackOutlineColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                          return kWhite;
                        }),
                        thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                          return kWhite;
                        }),
                        activeColor: kPrimaryColor,
                        inactiveTrackColor: kDeactiveColor,
                        value: controller.isDetailsDisplayed,
                        onChanged: controller.toggleDetailsDisplay,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: controller.addItem,
                child: Text('Add Item'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
