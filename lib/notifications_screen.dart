import 'package:flutter/material.dart';
import 'chat_detail.dart';
import 'chat_screen.dart';
import 'main_screen.dart';
import 'mytrips_current.dart';
import 'profile_screen.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    // Get the height of the bottom navigation bar
    final double bottomNavBarHeight = kBottomNavigationBarHeight;

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
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
                        top: 100,
                        left: 16,
                        right: 16,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Notifications',
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
                              child: const Row(
                                children: [
                                  Icon(Icons.search, color: Colors.white, size: 30),
                                ],
                              ),
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
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.0),
                  child: Column(  // Sử dụng Column để chứa nhiều widget NotificationsList
                    children: [
                      NotificationsList(
                        notification: "Duong dsjhfklkdsl;f'ldskdjhfkjhdk",
                        image: "assets/images/Tuan Tran 1.png",
                        times: "10:30 AM",
                      ),
                      NotificationsList(
                        notification: "Duongdsfvs/df df kvcsd fdsfsed ",
                        image: "assets/images/Emmy 1.png",
                        times: "10:30 AM",
                      ),
                      NotificationsList(
                        notification: "Duong dsflshdjkfhsjdhfjsdhjh dfkshfjhsdkf dsfjkhfjsdh kjdsk sjhfkdsjh ds jfhkfjhskj fkjsh",
                        image: "assets/images/Tuan Tran 1.png",
                        times: "10:30 AM",
                      ),
                      NotificationsList(
                        notification: "Duong",
                        image: "assets/images/Emmy 1.png",
                        times: "10:30 AM",
                      ),
                    ],
                  ),
                ),
              ),

            ],
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
          _buildNavItem("assets/images/Chat-Inactive.png", () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatScreen()));
          }),
          _buildNavItem("assets/images/Notifications-Active.png", () {
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
class NotificationsList extends StatefulWidget {
  final String notification;
  final String image;
  final String times;

  const NotificationsList({super.key,
    required this.notification,
    required this.image,
    required this.times,
  });

  @override
  _NotificationsListState createState() => _NotificationsListState();
}

class _NotificationsListState extends State<NotificationsList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to ChatDetailScreen when clicked
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailScreen(
              name: widget.notification,
              image: widget.image, // Pass image
            ),
          ),
        );
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 10,
        // Height adjusted to fit content
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFFE8E8E8), // Color of the bottom border
                width: 1.0, // Width of the bottom border
              ),
            ),
          ),
          child: Card(
            elevation: 0, // Remove card elevation to avoid shadow
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image placed in ClipOval
                  ClipOval(
                    child: Image.asset(
                      widget.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10), // Space between image and text
                  // Text content
                  Expanded( // Wrap Column in Expanded
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.notification,
                          style: const TextStyle(fontSize: 16),
                          maxLines: 2, // Adjust max lines to fit better
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          widget.times,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
