import 'package:web_app/src/domain/entities/item.dart';
import 'package:web_app/src/domain/entities/user.dart';

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
    required User createdBy,
    required bool isDetailsDisplayed,
    bool? isItemVisible,
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
          createdBy: createdBy,
          isDetailsDisplayed: isDetailsDisplayed,
          isItemVisible: isItemVisible,
        );

  factory Phone.fromJson(Map<String, dynamic> json) {
    return Phone(
      id: json['_id'],
      title: json['Title'],
      price: json['Price'],
      imageUrl: json['Image'],
      description: json['Description'],
      createdBy: User.fromJson(json['Created By']),
      isDetailsDisplayed: json['Details Display'] ?? false,
      isItemVisible: json['Item Visibility'] ?? true,
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

  @override
  Map<String, dynamic> toJson() {
    return {
      'Title': title,
      'Price': price,
      'Image': imageUrl,
      'Description': description,
      'Created By': createdBy.toJson(),
      'Details Display': isDetailsDisplayed,
      'Item Visibility': isItemVisible,
      'Brand': brand,
      'Model': model,
      'Year': year,
      'Operating System': operatingSystem,
      'Processor': processor,
      'RAM': ram,
      'Storage': storage,
      'Camera Specifications': cameraSpecifications,
      'Battery Capacity': batteryCapacity,
    };
  }
}
