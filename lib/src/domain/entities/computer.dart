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
    required String category,
    required String title,
    required String price,
    required String imageUrl,
    required String description,
    required User createdBy,
    required String createdDate,
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

  factory Computer.fromJson(Map<String, dynamic> json) {
    return Computer(
      id: json['_id'],
      category: json['Category'] ?? '',
      title: json['Title'] ?? '',
      price: json['Price'] ?? '',
      imageUrl: json['Image'] ?? '',
      description: json['Description'] ?? '',
      createdBy: User.fromJson(json['Created By']),
      createdDate: json['Created Date'] ?? '',
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
