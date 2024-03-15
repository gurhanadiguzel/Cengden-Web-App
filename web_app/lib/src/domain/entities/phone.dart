import 'package:web_app/src/domain/entities/item.dart';

class Phone extends Item {
  String? brand;
  String? model;
  String? year;
  String? operatingSystem;
  String? processor;
  String? ram;
  String? storage;
  String? cameraSpecification;
  String? batteryCapacity;

  Phone({
    required String title,
    required String price,
    required String imageUrl,
    required String description,
    this.brand,
    this.model,
    this.year,
    this.operatingSystem,
    this.processor,
    this.ram,
    this.storage,
    this.cameraSpecification,
    this.batteryCapacity,
  }) : super(
          title: title,
          price: price,
          imageUrl: imageUrl,
          description: description,
        );
}
