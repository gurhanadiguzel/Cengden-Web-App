import 'package:flutter/material.dart';
import 'package:web_app/src/app/pages/add_item/add_item_controller.dart';
import 'package:web_app/src/app/widgets/cengden_text_field.dart';
import 'package:web_app/src/domain/repositories/item_controller.dart';

class ComputerFieldsWidget extends StatelessWidget {
  final ItemController controller;
  const ComputerFieldsWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size * 2;

    return Column(
      children: [
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Type",
          isObscure: false,
          onChanged: (String value) {
            controller.setType(value);
          },
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Brand",
          isObscure: false,
          onChanged: (String value) {
            controller.setBrand(value);
          },
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Model",
          isObscure: false,
          onChanged: (String value) {
            controller.setModel(value);
          },
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Year",
          isObscure: false,
          onChanged: (String value) {
            controller.setYear(value);
          },
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Processor",
          isObscure: false,
          onChanged: (String value) {
            controller.setProcessor(value);
          },
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "RAM",
          isObscure: false,
          onChanged: (String value) {
            controller.setRAM(value);
          },
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Storage as \"Type: Value, Type: Value\" ",
          isObscure: false,
          onChanged: (String value) {
            controller.setStorageComputer(value);
          },
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Graphic Card",
          isObscure: false,
          onChanged: (String value) {
            controller.setGraphicCard(value);
          },
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Operating System",
          isObscure: false,
          onChanged: (String value) {
            controller.setOperatingSystem(value);
          },
        ),
      ],
    );
  }
}

class PhoneFieldsWidget extends StatelessWidget {
  final ItemController controller;

  const PhoneFieldsWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size * 2;

    return Column(
      children: [
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Brand",
          isObscure: false,
          onChanged: (String value) {
            controller.setBrand(value);
          },
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Model",
          isObscure: false,
          onChanged: (String value) {
            controller.setModel(value);
          },
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Year",
          isObscure: false,
          onChanged: (String value) {
            controller.setYear(value);
          },
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Processor",
          isObscure: false,
          onChanged: (String value) {
            controller.setProcessor(value);
          },
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "RAM",
          isObscure: false,
          onChanged: (String value) {
            controller.setRAM(value);
          },
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Storage",
          isObscure: false,
          onChanged: (String value) {
            controller.setStoragePhone(value);
          },
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Camera Specifications as \"Type: Value, Type: Value\" ",
          isObscure: false,
          onChanged: (String value) {
            controller.setCameraSpesifications(value);
          },
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Battery Capacity",
          isObscure: false,
          onChanged: (String value) {
            controller.setBatteryCapacity(value);
          },
        ),
      ],
    );
  }
}

class VehicleFieldsWidget extends StatelessWidget {
  final ItemController controller;

  const VehicleFieldsWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size * 2;

    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          width: (size.width - 40) / 4,
          child: DropdownButtonFormField<String>(
            value: controller.getCarType(),
            onChanged: (value) {
              controller.setType(value);
            },
            items: [
              DropdownMenuItem(
                value: 'Sedan',
                child: Text('Sedan'),
              ),
              DropdownMenuItem(
                value: 'Electric Car',
                child: Text('Electric Car'),
              ),
              DropdownMenuItem(
                value: 'Caravan',
                child: Text('Caravan'),
              ),
              DropdownMenuItem(
                value: 'Truck',
                child: Text('Truck'),
              ),
            ],
            decoration: const InputDecoration(labelText: 'Car Type'),
          ),
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Brand",
          isObscure: false,
          onChanged: (String value) {
            controller.setBrand(value);
          },
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Model",
          isObscure: false,
          onChanged: (String value) {
            controller.setModel(value);
          },
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Year",
          isObscure: false,
          onChanged: (String value) {
            controller.setYear(value);
          },
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Color",
          isObscure: false,
          onChanged: (String value) {
            controller.setColor(value);
          },
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Engine Displacement",
          isObscure: false,
          onChanged: (String value) {
            controller.setEngineDisplacement(value);
          },
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Fuel Type",
          isObscure: false,
          onChanged: (String value) {
            controller.setFuelType(value);
          },
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Transmission Type",
          isObscure: false,
          onChanged: (String value) {
            controller.setTransmissionType(value);
          },
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Mileage",
          isObscure: false,
          onChanged: (String value) {
            controller.setMileage(value);
          },
        ),
        controller.getCarType() == 'Electric Car'
            ? Column(
                children: [
                  CengdenTextField(
                    size: size,
                    title: "",
                    hintText: "Battery Capacity",
                    isObscure: false,
                    onChanged: (String value) {
                      controller.setBatteryCapacity(value);
                    },
                  ),
                  CengdenTextField(
                    size: size,
                    title: "",
                    hintText: "Range",
                    isObscure: false,
                    onChanged: (String value) {
                      controller.setRange(value);
                    },
                  ),
                ],
              )
            : controller.getCarType() == 'Caravan'
                ? Column(
                    children: [
                      CengdenTextField(
                        size: size,
                        title: "",
                        hintText: "Bed Capacity",
                        isObscure: false,
                        onChanged: (String value) {
                          controller.setBedCapacity(value);
                        },
                      ),
                      CengdenTextField(
                        size: size,
                        title: "",
                        hintText: "Water Tank Capacity",
                        isObscure: false,
                        onChanged: (String value) {
                          controller.setWaterTankCapacity(value);
                        },
                      ),
                    ],
                  )
                : controller.getCarType() == 'Truck'
                    ? CengdenTextField(
                        size: size,
                        title: "",
                        hintText: "Payload Capacity",
                        isObscure: false,
                        onChanged: (String value) {
                          controller.setPayloadCapacity(value);
                        },
                      )
                    : SizedBox(),
      ],
    );
  }
}

class PrivateLessonFieldsWidget extends StatelessWidget {
  final ItemController controller;

  const PrivateLessonFieldsWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size * 2;

    return Column(
      children: [
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Tutor Name",
          isObscure: false,
          onChanged: (String value) {
            controller.setTutorName(value);
          },
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Lessons as \"Lesson, Lesson\"",
          isObscure: false,
          onChanged: (String value) {
            controller.setLessons(value);
          },
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Location",
          isObscure: false,
          onChanged: (String value) {
            controller.setLocation(value);
          },
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Duration",
          isObscure: false,
          onChanged: (String value) {
            controller.setDuration(value);
          },
        ),
      ],
    );
  }
}
