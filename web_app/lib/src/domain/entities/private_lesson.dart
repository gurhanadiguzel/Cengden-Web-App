import 'package:web_app/src/domain/entities/item.dart';

class PrivateLesson extends Item {
  String? tutorName;
  String? lessons;
  String? location;
  String? duration;

  // Constructor for PrivateLesson class
  PrivateLesson({
    required String id,
    required String title,
    required String price,
    required String imageUrl,
    required String description,
    this.tutorName,
    this.lessons,
    this.location,
    this.duration,
  }) : super(
          id: id,
          title: title,
          price: price,
          imageUrl: imageUrl,
          description: description,
        );
}
