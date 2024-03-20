import 'package:web_app/src/domain/entities/item.dart';
import 'package:web_app/src/domain/entities/user.dart';

class Computer extends Item {
  String? type;
  String? brand;
  String? model;
  String? year;
  String? processor;
  String? ram;
  Map<String, String>? storage;
  String? graphicsCard;
  String? operatingSystem;

  Computer({
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
    this.processor,
    this.ram,
    this.storage,
    this.graphicsCard,
    this.operatingSystem,
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

  factory Computer.fromJson(Map<String, dynamic> json) {
    return Computer(
      id: json['_id'],
      title: json['Title'] ?? '',
      price: json['Price'] ?? '',
      imageUrl: json['Image'] ?? '',
      description: json['Description'] ?? '',
      createdBy: User.fromJson(json['Created By']),
      isDetailsDisplayed: json['Details Display'] ?? false,
      isVisible: json['Item Visibility'] ?? true,
      type: json['Type'] ?? '',
      brand: json['Brand'] ?? '',
      model: json['Model'] ?? '',
      year: json['Year'] ?? '',
      processor: json['Processor'] ?? '',
      ram: json['RAM'] ?? '',
      storage: Map<String, String>.from(json['Storage']),
      graphicsCard: json['Graphics Card'] ?? '',
      operatingSystem: json['Operating System'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
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
      'Processor': processor,
      'RAM': ram,
      'Storage': storage,
      'Graphics Card': graphicsCard,
      'Operating System': operatingSystem,
    };
  }
}
