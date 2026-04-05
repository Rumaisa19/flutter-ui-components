class Product {
  final String id;
  final String title;
  final String category;
  final double price;
  final String imageUrl;
  final String condition;
  final bool isNew;

  const Product({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.condition,
    this.isNew = false,
  });
}
