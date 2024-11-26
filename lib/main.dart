import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'screens/guide_list_screen.dart'; // Import chính xác

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(), // Hiển thị màn hình danh sách hướng dẫn viên
    );
  }
}
