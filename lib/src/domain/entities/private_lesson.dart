import 'package:web_app/src/domain/entities/item.dart';
import 'package:web_app/src/domain/entities/user.dart';

class PrivateLesson extends Item {
  String? tutorName;
  List<String>? lessons;
  String? location;
  String? duration;

  PrivateLesson({
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
    this.tutorName,
    this.lessons,
    this.location,
    this.duration,
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

  factory PrivateLesson.fromJson(Map<String, dynamic> json) {
    return PrivateLesson(
      id: json['_id'] ?? '',
      category: json['Category'] ?? '',
      title: json['Title'] ?? '',
      price: json['Price'] ?? '',
      imageUrl: json['Image'] ?? '',
      description: json['Description'] ?? '',
      createdBy: User.fromJson(json['Created By']),
      createdDate: json['Created Date'] ?? '',
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
      'Tutor Name': tutorName,
      'Lessons': lessons,
      'Location': location,
      'Duration': duration,
    };
  }
}
