import 'package:web_app/src/domain/entities/item.dart';

class Phone extends Item {
  String? brand;
  String? model;
  String? year;
  String? operatingSystem;
  String? processor;
  String? ram;
  String? storage;
  Map<String, String>? cameraSpecifications;
  String? batteryCapacity;

  Phone({
    required String id,
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
    this.cameraSpecifications,
    this.batteryCapacity,
  }) : super(
          id: id,
          title: title,
          price: price,
          imageUrl: imageUrl,
          description: description,
        );

  factory Phone.fromJson(Map<String, dynamic> json) {
    return Phone(
      id: json['_id'] ?? '',
      title: json['Title'] ?? '',
      price: json['Price'] ?? '',
      imageUrl: json['Image'] ?? '',
      description: json['Description'] ?? '',
      brand: json['Brand'],
      model: json['Model'],
      year: json['Year'],
      operatingSystem: json['Operating System'],
      processor: json['Processor'],
      ram: json['RAM'],
      storage: json['Storage'],
      cameraSpecifications: Map<String, String>.from(json['Camera Specifications']),
      batteryCapacity: json['Battery Capacity'],
    );
  }
}
