class Review {
  final String customerId;
  final String guideId;
  final int rating;
  final String comment;
  final DateTime date;

  Review({
    required this.customerId,
    required this.guideId,
    required this.rating,
    required this.comment,
    required this.date,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      customerId: json['customerId'] ?? '',
      guideId: json['guideId'] ?? '',
      rating: json['rating'] ?? '',
      comment: json['comment']?? '',
      date: DateTime.parse(json['date']),
    );
  }
}
