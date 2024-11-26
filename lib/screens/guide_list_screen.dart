import 'package:flutter/material.dart';
import '../models/modelguide.dart';
import '../services/api_service.dart';


class GuideListScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Danh sách Hướng Dẫn Viên')),
      body: FutureBuilder<List<Guide>>(
        future: apiService.fetchGuides(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Có lỗi xảy ra: ${snapshot.error}'));
          } else {
            final guides = snapshot.data!;
            return ListView.builder(
              itemCount: guides.length,
              itemBuilder: (context, index) {
                final guide = guides[index];
                return ListTile(
                  title: Text(guide.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email: ${guide.email}'),
                      Text('Số điện thoại: ${guide.phoneNumber}'),
                      Text('Ngôn ngữ: ${guide.languages.join(', ')}'),
                      Text('Chuyên môn: ${guide.specialties.join(', ')}'),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
