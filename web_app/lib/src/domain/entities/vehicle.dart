import 'package:web_app/src/domain/entities/item.dart';

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
        );

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['_id'],
      title: json['Title'],
      type: json['Type'],
      brand: json['Brand'],
      model: json['Model'],
      year: json['Year'],
      color: json['Color'],
      engineDisplacement: json['EngineDisplacement'],
      fuelType: json['FuelType'],
      transmissionType: json['TransmissionType'],
      mileage: json['Mileage'],
      price: json['Price'],
      imageUrl: json['Image'],
      description: json['Description'],
      batteryCapacity: json['Battery Capacity'] ?? '',
      range: json['Range'] ?? '',
      bedCapacity: json['Bed Capacity'] ?? '',
      waterTankCapacity: json['Water Tank Capacity'] ?? '',
      payloadCapacity: json['Payload Capacity'] ?? '',
    );
  }
}
