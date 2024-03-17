abstract class Item {
  final String id;
  final String title;
  final String price;
  final String imageUrl;
  final String description;

  Item({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('fromJson must be implemented in concrete subclass');
  }

  Map<String, dynamic> toJson() {
    throw UnimplementedError('toJson must be implemented in concrete subclass');
  }
}
