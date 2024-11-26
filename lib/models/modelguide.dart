class Guide {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final List<String> languages;
  final List<String> specialties;

  Guide({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.languages,
    required this.specialties,
  });

  // Chuyển JSON thành đối tượng Guide với xử lý null
  factory Guide.fromJson(Map<String, dynamic> json) {
    return Guide(
      id: json['id'] ?? '', // Giá trị mặc định là chuỗi rỗng nếu null
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      languages: json['languages'] != null
          ? List<String>.from(json['languages'])
          : [], // Giá trị mặc định là danh sách rỗng nếu null
      specialties: json['specialties'] != null
          ? List<String>.from(json['specialties'])
          : [], // Giá trị mặc định là danh sách rỗng nếu null
    );
  }
}
