class Customer {
  final String name;
  final String email;
  final String phoneNumber;
  final List<String> preferences;

  Customer({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.preferences,
  });

  // Hàm để chuyển từ JSON thành đối tượng Customer
  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      preferences: List<String>.from(json['preferences']),
    );
  }
}
