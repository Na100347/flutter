import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'main_screen.dart';
import 'mytrips_current.dart';
import 'notifications_screen.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                        top: 60,
                        left: 16,
                        right: 16,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Profile',
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
          _buildNavItem("assets/images/Notifications-Inactive.png", () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsScreen()));
          }),
          _buildNavItem("assets/images/Profile-Active.png", () {
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
