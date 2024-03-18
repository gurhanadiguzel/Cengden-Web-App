import 'package:web_app/src/domain/entities/user.dart';

abstract class Item {
  String id;
  String title;
  String price;
  String imageUrl;
  String description;
  User createdBy;
  bool isDetailsDisplayed;
  bool? isItemVisible;

  Item({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.createdBy,
    required this.isDetailsDisplayed,
    bool? isItemVisible,
  }) : isItemVisible = isItemVisible ?? true;

  factory Item.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('fromJson must be implemented in concrete subclass');
  }

  Map<String, dynamic> toJson() {
    throw UnimplementedError('toJson must be implemented in concrete subclass');
  }
}
