import 'package:web_app/src/domain/entities/item.dart';

class Computer extends Item {
  String? type;
  String? brand;
  String? model;
  String? year;
  String? processor;
  String? ram;
  Map<String, String>? storage;
  String? graphicCard;
  String? operatingSystem;

  Computer({
    required String id,
    required String title,
    required String price,
    required String imageUrl,
    required String description,
    this.type,
    this.brand,
    this.model,
    this.year,
    this.processor,
    this.ram,
    this.storage,
    this.graphicCard,
    this.operatingSystem,
  }) : super(
          id: id,
          title: title,
          price: price,
          imageUrl: imageUrl,
          description: description,
        );

  factory Computer.fromJson(Map<String, dynamic> json) {
    final id = json['_id'] != null ? json['_id']['\$oid'] : '';
    return Computer(
      id: id,
      title: json['Title'] ?? '',
      price: json['Price'] ?? '',
      imageUrl: json['Image'] ?? '',
      description: json['Description'] ?? '',
      type: json['Type'],
      brand: json['Brand'],
      model: json['Model'],
      year: json['Year'],
      processor: json['Processor'],
      ram: json['RAM'],
      storage: Map<String, String>.from(json['Storage']),
      graphicCard: json['Graphics Card'],
      operatingSystem: json['Operating System'],
    );
  }
}
