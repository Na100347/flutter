class Tour {
  final String title;
  final String description;
  final String guideId;
  final int price;
  final int duration;
  final List<String> locations;
  final DateTime dateAvailable;

  Tour({
    required this.title,
    required this.description,
    required this.guideId,
    required this.price,
    required this.duration,
    required this.locations,
    required this.dateAvailable,
  });

  factory Tour.fromJson(Map<String, dynamic> json) {
    return Tour(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      guideId: json['guideId'] ?? '',
      price: json['price'] ?? 0,
      duration: json['duration'] ?? 0,
      locations: List<String>.from(json['locations']),
      dateAvailable: DateTime.parse(json['dateAvailable']),
    );
  }
}
