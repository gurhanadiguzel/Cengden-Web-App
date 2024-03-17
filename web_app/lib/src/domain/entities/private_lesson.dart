import 'package:web_app/src/domain/entities/item.dart';

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

  factory PrivateLesson.fromJson(Map<String, dynamic> json) {
    return PrivateLesson(
      id: json['_id'] ?? '',
      title: json['Title'],
      tutorName: json['Tutor Name'],
      lessons: (json['Lessons'] as List<dynamic>).cast<String>(),
      location: json['Location'],
      duration: json['Duration'],
      price: json['Price'],
      imageUrl: json['Image'],
      description: json['Description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'Title': title,
      'Tutor Name': tutorName,
      'Lessons': lessons,
      'Location': location,
      'Duration': duration,
      'Price': price,
      'Image': imageUrl,
      'Description': description,
    };
  }
}
