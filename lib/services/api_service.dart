import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/modelguide.dart';
import '../models/modelreview.dart';
import '../models/modeltour.dart';
import '../models/modelustomer.dart';


class ApiService {
  // Đường dẫn cơ bản của API
  static const String baseUrl = 'https://server-api-flutter-main.onrender.com';
  // Hàm lấy danh sách Customers từ API
  Future<List<Customer>> fetchCustomers() async {
    final response = await http.get(Uri.parse('$baseUrl/customers'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Customer.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load customers');
    }
  }

  // Hàm lấy danh sách Tours từ API
  Future<List<Tour>> fetchTours() async {
    final response = await http.get(Uri.parse('$baseUrl/api/tours'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Tour.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load tours');
    }
  }

  // Hàm lấy danh sách Reviews từ API
  Future<List<Review>> fetchReviews() async {
    final response = await http.get(Uri.parse('$baseUrl/reviews'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Review.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load reviews');
    }
  }

  // Hàm lấy danh sách Guides từ API
  Future<List<Guide>> fetchGuides() async {
    final response = await http.get(Uri.parse('$baseUrl/guides'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Guide.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load guides');
    }
  }
}
