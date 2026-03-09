class DestinationModel {
  final String name;
  final String location;
  final String description;
  final String imageUrl;
  final double distanceKm;
  final double durationHrs;
  final double price;

  const DestinationModel({
    required this.name,
    required this.location,
    required this.description,
    required this.imageUrl,
    required this.distanceKm,
    required this.durationHrs,
    required this.price,
  });
}
