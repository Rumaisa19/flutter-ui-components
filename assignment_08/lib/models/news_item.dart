class NewsItem {
  final String id;
  final String title;
  final String category;
  final String description;
  final String imageUrl;
  final bool isFeatured;

  const NewsItem({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.imageUrl,
    this.isFeatured = false,
  });
}
