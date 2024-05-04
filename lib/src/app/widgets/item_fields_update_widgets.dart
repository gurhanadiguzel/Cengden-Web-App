import 'package:flutter/material.dart';
import 'package:web_app/src/app/widgets/cengden_text_field.dart';
import 'package:web_app/src/domain/entities/computer.dart';
import 'package:web_app/src/domain/entities/phone.dart';
import 'package:web_app/src/domain/entities/private_lesson.dart';
import 'package:web_app/src/domain/entities/vehicle.dart';
import 'package:web_app/src/domain/repositories/item_controller.dart';

class ComputerFieldsWidget extends StatelessWidget {
  final ItemController controller;
  final Computer? computer;

  const ComputerFieldsWidget({
    super.key,
    required this.controller,
    this.computer,
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
          initialValue: computer != null ? computer!.type : '',
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Brand",
          isObscure: false,
          onChanged: (String value) {
            controller.setBrand(value);
          },
          initialValue: computer != null ? computer!.brand : '',
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Model",
          isObscure: false,
          onChanged: (String value) {
            controller.setModel(value);
          },
          initialValue: computer != null ? computer!.model : '',
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Year",
          isObscure: false,
          onChanged: (String value) {
            controller.setYear(value);
          },
          initialValue: computer != null ? computer!.year : '',
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Processor",
          isObscure: false,
          onChanged: (String value) {
            controller.setProcessor(value);
          },
          initialValue: computer != null ? computer!.processor : '',
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "RAM",
          isObscure: false,
          onChanged: (String value) {
            controller.setRAM(value);
          },
          initialValue: computer != null ? computer!.ram : '',
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Storage as \"Type: Value, Type: Value\" ",
          isObscure: false,
          onChanged: (String value) {
            controller.setStorageComputer(value);
          },
          initialValue: computer != null ? computer!.storage.toString().replaceAll(RegExp(r'[{}]+'), '') : '',
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Graphics Card",
          isObscure: false,
          onChanged: (String value) {
            controller.setGraphicCard(value);
          },
          initialValue: computer != null ? computer!.graphicsCard : '',
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Operating System",
          isObscure: false,
          onChanged: (String value) {
            controller.setOperatingSystem(value);
          },
          initialValue: computer != null ? computer!.operatingSystem : '',
        ),
      ],
    );
  }
}

class PhoneFieldsWidget extends StatelessWidget {
  final ItemController controller;
  final Phone? phone;

  const PhoneFieldsWidget({
    super.key,
    required this.controller,
    this.phone,
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
          initialValue: phone != null ? phone!.brand : '',
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Model",
          isObscure: false,
          onChanged: (String value) {
            controller.setModel(value);
          },
          initialValue: phone != null ? phone!.model : '',
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Year",
          isObscure: false,
          onChanged: (String value) {
            controller.setYear(value);
          },
          initialValue: phone != null ? phone!.year : '',
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
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Processor",
          isObscure: false,
          onChanged: (String value) {
            controller.setProcessor(value);
          },
          initialValue: phone != null ? phone!.processor : '',
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "RAM",
          isObscure: false,
          onChanged: (String value) {
            controller.setRAM(value);
          },
          initialValue: phone != null ? phone!.ram : '',
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Storage",
          isObscure: false,
          onChanged: (String value) {
            controller.setStoragePhone(value);
          },
          initialValue: phone != null ? phone!.storage : '',
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Camera Specifications as \"Type: Value, Type: Value\" ",
          isObscure: false,
          onChanged: (String value) {
            controller.setCameraSpesifications(value);
          },
          initialValue: phone != null ? phone!.cameraSpecifications.toString().replaceAll(RegExp(r'[{}]+'), '') : '',
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Battery Capacity",
          isObscure: false,
          onChanged: (String value) {
            controller.setBatteryCapacity(value);
          },
          initialValue: phone != null ? phone!.batteryCapacity : '',
        ),
      ],
    );
  }
}

class VehicleFieldsWidget extends StatelessWidget {
  final ItemController controller;
  final Vehicle? vehicle;

  const VehicleFieldsWidget({
    super.key,
    required this.controller,
    this.vehicle,
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
            items: const [
              DropdownMenuItem(
                value: 'Sedan',
                child: Text('Sedan'),
              ),
              DropdownMenuItem(
                value: 'SUV',
                child: Text('SUV'),
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
          initialValue: vehicle != null ? vehicle!.brand : '',
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Model",
          isObscure: false,
          onChanged: (String value) {
            controller.setModel(value);
          },
          initialValue: vehicle != null ? vehicle!.model : '',
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Year",
          isObscure: false,
          onChanged: (String value) {
            controller.setYear(value);
          },
          initialValue: vehicle != null ? vehicle!.year : '',
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Color",
          isObscure: false,
          onChanged: (String value) {
            controller.setColor(value);
          },
          initialValue: vehicle != null ? vehicle!.color : '',
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Engine Displacement",
          isObscure: false,
          onChanged: (String value) {
            controller.setEngineDisplacement(value);
          },
          initialValue: vehicle != null ? vehicle!.engineDisplacement : '',
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Fuel Type",
          isObscure: false,
          onChanged: (String value) {
            controller.setFuelType(value);
          },
          initialValue: vehicle != null ? vehicle!.fuelType : '',
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Transmission Type",
          isObscure: false,
          onChanged: (String value) {
            controller.setTransmissionType(value);
          },
          initialValue: vehicle != null ? vehicle!.transmissionType : '',
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Mileage",
          isObscure: false,
          onChanged: (String value) {
            controller.setMileage(value);
          },
          initialValue: vehicle != null ? vehicle!.mileage : '',
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
                    initialValue: vehicle != null ? vehicle!.batteryCapacity : '',
                  ),
                  CengdenTextField(
                    size: size,
                    title: "",
                    hintText: "Range",
                    isObscure: false,
                    onChanged: (String value) {
                      controller.setRange(value);
                    },
                    initialValue: vehicle != null ? vehicle!.range : '',
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
                        initialValue: vehicle != null ? vehicle!.bedCapacity : '',
                      ),
                      CengdenTextField(
                        size: size,
                        title: "",
                        hintText: "Water Tank Capacity",
                        isObscure: false,
                        onChanged: (String value) {
                          controller.setWaterTankCapacity(value);
                        },
                        initialValue: vehicle != null ? vehicle!.waterTankCapacity : '',
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
                        initialValue: vehicle != null ? vehicle!.payloadCapacity : '',
                      )
                    : SizedBox(),
      ],
    );
  }
}

class PrivateLessonFieldsWidget extends StatelessWidget {
  final ItemController controller;
  final PrivateLesson? privateLesson;

  const PrivateLessonFieldsWidget({
    super.key,
    required this.controller,
    this.privateLesson,
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
          initialValue: privateLesson != null ? privateLesson!.tutorName : '',
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Lessons as \"Lesson1, Lesson2\"",
          isObscure: false,
          onChanged: (String value) {
            controller.setLessons(value);
          },
          initialValue:
              privateLesson != null ? privateLesson!.lessons.toString().replaceAll(RegExp(r'[\[\]]+'), '') : '',
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Location",
          isObscure: false,
          onChanged: (String value) {
            controller.setLocation(value);
          },
          initialValue: privateLesson != null ? privateLesson!.location : '',
        ),
        CengdenTextField(
          size: size,
          title: "",
          hintText: "Duration",
          isObscure: false,
          onChanged: (String value) {
            controller.setDuration(value);
          },
          initialValue: privateLesson != null ? privateLesson!.duration : '',
        ),
      ],
    );
  }
}
