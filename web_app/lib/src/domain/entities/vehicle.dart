import 'package:web_app/src/domain/entities/item.dart';
import 'package:web_app/src/domain/entities/user.dart';

class Vehicle extends Item {
  String? type;
  String? brand;
  String? model;
  String? year;
  String? color;
  String? engineDisplacement;
  String? fuelType;
  String? transmissionType;
  String? mileage;
  String? batteryCapacity;
  String? range;
  String? bedCapacity;
  String? waterTankCapacity;
  String? payloadCapacity;

  Vehicle({
    required String id,
    required String title,
    required String price,
    required String imageUrl,
    required String description,
    required User createdBy,
    required bool isDetailsDisplayed,
    bool? isVisible,
    this.type,
    this.brand,
    this.model,
    this.year,
    this.color,
    this.engineDisplacement,
    this.fuelType,
    this.transmissionType,
    this.mileage,
    this.batteryCapacity,
    this.range,
    this.bedCapacity,
    this.waterTankCapacity,
    this.payloadCapacity,
  }) : super(
          id: id,
          title: title,
          price: price,
          imageUrl: imageUrl,
          description: description,
          createdBy: createdBy,
          isDetailsDisplayed: isDetailsDisplayed,
          isVisible: isVisible,
        );

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['_id'],
      title: json['Title'],
      price: json['Price'],
      imageUrl: json['Image'],
      description: json['Description'],
      createdBy: User.fromJson(json['Created By']),
      isDetailsDisplayed: json['Details Display'] ?? false,
      isVisible: json['Item Visibility'] ?? true,
      type: json['Type'],
      brand: json['Brand'],
      model: json['Model'],
      year: json['Year'],
      color: json['Color'],
      engineDisplacement: json['Engine Displacement'],
      fuelType: json['Fuel Type'],
      transmissionType: json['Transmission Type'],
      mileage: json['Mileage'],
      batteryCapacity: json['Battery Capacity'] ?? '',
      range: json['Range'] ?? '',
      bedCapacity: json['Bed Capacity'] ?? '',
      waterTankCapacity: json['Water Tank Capacity'] ?? '',
      payloadCapacity: json['Payload Capacity'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {
      'Title': title,
      'Price': price,
      'Image': imageUrl,
      'Description': description,
      'Created By': createdBy.toJson(),
      'Details Display': isDetailsDisplayed,
      'Item Visibility': isVisible,
      'Type': type,
      'Brand': brand,
      'Model': model,
      'Year': year,
      'Color': color,
      'Engine Displacement': engineDisplacement,
      'FuelType': fuelType,
      'Transmission Type': transmissionType,
      'Mileage': mileage,
      'Battery Capacity': batteryCapacity,
      'Range': range,
      'Bed Capacity': bedCapacity,
      'Water Tank Capacity': waterTankCapacity,
      'Payload Capacity': payloadCapacity,
    };
    json.removeWhere((key, value) => value == null);
    return json;
  }
}
