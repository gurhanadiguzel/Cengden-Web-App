import 'package:web_app/src/domain/entities/computer.dart';
import 'package:web_app/src/domain/entities/phone.dart';
import 'package:web_app/src/domain/entities/private_lesson.dart';
import 'package:web_app/src/domain/entities/user.dart';
import 'package:web_app/src/domain/entities/vehicle.dart';

abstract class Item {
  String id;
  String category;
  String title;
  String price;
  String imageUrl;
  String description;
  User createdBy;
  String createdDate;
  bool isDetailsDisplayed;
  bool? isVisible;

  Item({
    required this.id,
    required this.category,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.createdBy,
    required this.createdDate,
    required this.isDetailsDisplayed,
    bool? isVisible,
  }) : isVisible = isVisible ?? true;

  factory Item.fromJson(Map<String, dynamic> json) {
    switch (json['Category']) {
      case 'Computer':
        return Computer.fromJson(json);
      case 'Phone':
        return Phone.fromJson(json);
      case 'Vehicle':
        return Vehicle.fromJson(json);
      case 'PrivateLesson':
        return PrivateLesson.fromJson(json);
      default:
        throw Exception('Unsupported item category');
    }
  }

  Map<String, dynamic> toJson() {
    throw UnimplementedError('toJson must be implemented in concrete subclass');
  }
}
