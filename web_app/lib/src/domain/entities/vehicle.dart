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
  }) : super(
          id: id,
          title: title,
          price: price,
          imageUrl: imageUrl,
          description: description,
        );
}
