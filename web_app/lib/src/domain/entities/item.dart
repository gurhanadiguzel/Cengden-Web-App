class Item {
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
    final id = json['_id'] != null ? json['_id']['\$oid'] : '';
    return Item(
      id: id,
      title: json['Title'] ?? '',
      price: json['Price'] ?? '',
      imageUrl: json['Image'] ?? '',
      description: json['Description'] ?? '',
    );
  }
}
