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
    required String category,
    required String title,
    required String price,
    required String imageUrl,
    required String description,
    required User createdBy,
    required String createdDate,
    required bool isDetailsDisplayed,
    bool? isVisible,
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
          category: category,
          title: title,
          price: price,
          imageUrl: imageUrl,
          description: description,
          createdBy: createdBy,
          createdDate: createdDate,
          isDetailsDisplayed: isDetailsDisplayed,
          isVisible: isVisible,
        );

  factory Phone.fromJson(Map<String, dynamic> json) {
    return Phone(
      id: json['_id'],
      category: json['Category'],
      title: json['Title'],
      price: json['Price'],
      imageUrl: json['Image'],
      description: json['Description'],
      createdBy: User.fromJson(json['Created By']),
      createdDate: json['Created Date'] ?? '',
      isDetailsDisplayed: json['Details Display'] ?? false,
      isVisible: json['Item Visibility'] ?? true,
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
      if (id != '') '_id': {"\$oid": id},
      'Category': category,
      'Title': title,
      'Price': price,
      'Image': imageUrl,
      'Description': description,
      'Created By': createdBy.toJson(),
      'Created Date': createdDate,
      'Details Display': isDetailsDisplayed,
      'Item Visibility': isVisible,
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