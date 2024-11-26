import 'package:flutter/material.dart';
import 'chat_detail.dart';
import 'main_screen.dart';
import 'mytrips_current.dart';
import 'notifications_screen.dart';
import 'profile_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            automaticallyImplyLeading: false,
            floating: false,
            snap: false,
            expandedHeight: 140.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/image 3.png',
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 60,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Chat',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontFamily: 'Georgia',
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0x2F121212),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(Icons.search, color: Colors.white, size: 30),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Chat',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.0),
              child: Column(  // Sử dụng Column để chứa nhiều widget MessList
                children: [
                  MessList(
                    name: "Tuan",
                    image: "assets/images/Tuan Tran 1.png",
                    times: "10:30 AM",
                  ),
                  MessList(
                    name: "Alice",
                    image: "assets/images/Emmy 1.png",
                    times: "10:30 AM",
                  ),
                  MessList(
                    name: "Tuan",
                    image: "assets/images/Tuan Tran 1.png",
                    times: "10:30 AM",
                  ),
                  MessList(
                    name: "Alice",
                    image: "assets/images/Emmy 1.png",
                    times: "10:30 AM",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildNavItem("assets/images/Explore-Inactive.png", () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen()));
          }),
          _buildNavItem("assets/images/Trips-Inactive.png", () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MytripsCurrent()));
          }),
          _buildNavItem("assets/images/Chat-Active.png", () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatScreen()));
          }),
          _buildNavItem("assets/images/Notifications-Inactive.png", () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsScreen()));
          }),
          _buildNavItem("assets/images/Profile-Inactive.png", () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
          }),
        ],
      ),
    );
  }

  Widget _buildNavItem(String asset, VoidCallback onTap) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: GestureDetector(
          onTap: onTap,
          child: Image.asset(
            asset,
            fit: BoxFit.contain,
            height: 40,
            width: 40,
          ),
        ),
      ),
    );
  }
}

class MessList extends StatefulWidget {
  final String name;
  final String image;
  final String times;

  const MessList({
    required this.name,
    required this.image,
    required this.times,
  });

  @override
  _MessListState createState() => _MessListState();
}

class _MessListState extends State<MessList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Chuyển sang màn hình ChatDetailScreen khi click vào MessList, truyền thêm cả name và image
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailScreen(
              name: widget.name,
              image: widget.image,  // Truyền thêm hình ảnh
            ),
          ),
        );
      },
    child: SizedBox(
      width: MediaQuery.of(context).size.width - 10,
      height: 80, // Adjusted the height to fit the content
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Hình ảnh được đặt trong ClipOval
              ClipOval(
                child: Image.asset(
                  widget.image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10), // Khoảng cách giữa ảnh và văn bản
              // Văn bản
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        widget.times,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const Text(
                    "It's a beautiful place",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
