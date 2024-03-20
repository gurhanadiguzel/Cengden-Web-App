import 'package:web_app/src/domain/entities/item.dart';
import 'package:web_app/src/domain/entities/user.dart';

class PrivateLesson extends Item {
  String? tutorName;
  List<String>? lessons;
  String? location;
  String? duration;

  PrivateLesson({
    required String id,
    required String title,
    required String price,
    required String imageUrl,
    required String description,
    required User createdBy,
    required bool isDetailsDisplayed,
    bool? isVisible,
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
          createdBy: createdBy,
          isDetailsDisplayed: isDetailsDisplayed,
          isVisible: isVisible,
        );

  factory PrivateLesson.fromJson(Map<String, dynamic> json) {
    return PrivateLesson(
      id: json['_id'] ?? '',
      title: json['Title'] ?? '',
      price: json['Price'] ?? '',
      imageUrl: json['Image'] ?? '',
      description: json['Description'] ?? '',
      createdBy: User.fromJson(json['Created By']),
      isDetailsDisplayed: json['Details Display'] ?? false,
      isVisible: json['Item Visibility'] ?? true,
      tutorName: json['Tutor Name'] ?? '',
      lessons: (json['Lessons'] as List<dynamic>).cast<String>(),
      location: json['Location'] ?? '',
      duration: json['Duration'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Title': title,
      'Price': price,
      'Image': imageUrl,
      'Description': description,
      'Created By': createdBy.toJson(),
      'Details Display': isDetailsDisplayed,
      'Item Visibility': isVisible,
      'Tutor Name': tutorName,
      'Lessons': lessons,
      'Location': location,
      'Duration': duration,
    };
  }
}
