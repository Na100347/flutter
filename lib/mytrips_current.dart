import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'main_screen.dart';
import 'notifications_screen.dart';
import 'profile_screen.dart';

class MytripsCurrent extends StatefulWidget {
  const MytripsCurrent({super.key});

  @override
  _MytripsCurrentState createState() => _MytripsCurrentState();
}

class _MytripsCurrentState extends State<MytripsCurrent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this); // 4 tabs for trips
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
                              'My Trips',
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
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    // TabBar for navigation between trips
                    Container(
                      color: Colors.white,
                      child: TabBar(
                        controller: _tabController,
                        isScrollable: false,
                        indicator: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.grey,
                        indicatorPadding: EdgeInsets.zero,
                        labelPadding: EdgeInsets.zero,

                        tabs: const [
                          Tab(child: Padding(padding: EdgeInsets.all(3.0), child: Text('Current Trips'))),
                          Tab(child: Padding(padding: EdgeInsets.all(3.0), child: Text('Next Trips'))),
                          Tab(child: Padding(padding: EdgeInsets.all(3.0), child: Text('Past Trips'))),
                          Tab(child: Padding(padding: EdgeInsets.all(3.0), child: Text('Wish List'))),
                        ],
                      ),
                    ),
                    // TabBarView for displaying content based on selected tab
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 240 - bottomNavBarHeight, // Adjust the height
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          // Add your ListView with JourneyCard for each Tab
                          _widgetCurenTrips(),
                          _widgetNextTrips(),
                          _widgetPastTrips(),
                          _buildWishList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 299,
            top: 650,
            child: Image.asset(
              "assets/images/Group 50.png",
              width: 90,
              height: 90,
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _widgetCurenTrips(){
    return ListView(
      children: [
        const MyTripsCard(
          title: 'Dragon Bridge Trip',
          date: 'Jan 30, 2020',
          time: '13:00 - 15:00',
          image: 'assets/images/New Destination in Danang City.png',
          location: 'Da Nang, Vietnam',
          guideName: 'Tuan Tran',
          guideImage: 'assets/images/tuan_tran.png',
          isWide: true, // Whether the card should expand to the full width
          isFinish: true,
          isDetail: true,
          isChat: false,
          isPay: false ,
        ),
      ],
    );
  }
  Widget _widgetNextTrips(){
    return ListView(
      children: [
        const MyTripsCard(
          title: 'Dragon Bridge Trip',
          date: 'Jan 30, 2020',
          time: '13:00 - 15:00',
          image: 'assets/images/New Destination in Danang City.png',
          location: 'Da Nang, Vietnam',
          guideName: 'Tuan Tran',
          guideImage: 'assets/images/tuan_tran.png',
          isWide: true, // Whether the card should expand to the full width
          isFinish: false,
          isDetail: true,
          isChat: true,
          isPay: true,
        ),
        const MyTripsCard(
          title: 'Dragon Bridge Trip',
          date: 'Jan 30, 2020',
          time: '13:00 - 15:00',
          image: 'assets/images/New Destination in Danang City.png',
          location: 'Da Nang, Vietnam',
          guideName: 'Tuan Tran',
          guideImage: 'assets/images/tuan_tran.png',
          isWide: true, // Whether the card should expand to the full width
          isFinish: false,
          isDetail: true,
          isChat: false,
          isPay: false,
        ),
      ],
    );
  }

  Widget _widgetPastTrips() {
    return ListView(
      children: [
        const MyTripsCard(
          title: 'Dragon Bridge Trip',
          date: 'Jan 30, 2020',
          time: '13:00 - 15:00',
          image: 'assets/images/New Destination in Danang City.png',
          location: 'Da Nang, Vietnam',
          guideName: 'Tuan Tran',
          guideImage: 'assets/images/tuan_tran.png',
          isWide: true, // Whether the card should expand to the full width
          isFinish: false,
          isDetail: false,
          isChat: false,
          isPay: false,
        ),
        // You can add more cards like below
        const MyTripsCard(
          title: 'Ba Na Hills Trip',
          date: 'Feb 15, 2020',
          time: '09:00 - 17:00',
          image: 'assets/images/HoanKiemLake.png',
          location: 'Da Nang, Vietnam',
          guideName: 'Mai Pham',
          guideImage: 'assets/images/mai_pham.png',
          isWide: false,
          isFinish: false,
          isDetail: false,
          isChat: false,
          isPay: false,
        ),
        // Add more MyTripsCard widgets if needed
      ],
    );
  }
  Widget _buildWishList() {
    return ListView(
      children: [
        const JourneyCard(
          title: "Đà Nẵng - Ba Na - Hội An",
          subTitle: "Jan 30, 2020",
          price: "\$400.00",
          image: "assets/images/journey1.png",
          imageHeight: 135,
          imageWidth: double.infinity,
          isWide: true,
        ),
        const JourneyCard(
          title: "Đà Nẵng - Ba Na - Hội An",
          subTitle: "Jan 30, 2020",
          price: "\$400.00",
          image: "assets/images/journey1.png",
          imageHeight: 135,
          imageWidth: double.infinity,
          isWide: true,
        ),
        const JourneyCard(
          title: "Đà Nẵng - Ba Na - Hội An",
          subTitle: "Jan 30, 2020",
          price: "\$400.00",
          image: "assets/images/journey1.png",
          imageHeight: 135,
          imageWidth: double.infinity,
          isWide: true,
        ),
        const JourneyCard(
          title: "Đà Nẵng - Ba Na - Hội An",
          subTitle: "Jan 30, 2020",
          price: "\$400.00",
          image: "assets/images/journey1.png",
          imageHeight: 135,
          imageWidth: double.infinity,
          isWide: true,
        ),
        const JourneyCard(
          title: "Đà Nẵng - Ba Na - Hội An",
          subTitle: "Jan 30, 2020",
          price: "\$400.00",
          image: "assets/images/journey1.png",
          imageHeight: 135,
          imageWidth: double.infinity,
          isWide: true,
        ),
        // Add more JourneyCard widgets if needed
      ],
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
          _buildNavItem("assets/images/Trips-Active.png", () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MytripsCurrent()));
          }),
          _buildNavItem("assets/images/Chat-Inactive.png", () {
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

class MyTripsCard extends StatefulWidget {
  final String title;
  final String date;
  final String time;
  final String image;
  final String location;
  final String guideName;
  final String guideImage;
  final bool isWide;
  final bool isFinish;
  final bool isDetail;
  final bool isChat;
  final bool isPay;
  const MyTripsCard({
    Key? key,
    required this.title,
    required this.date,
    required this.time,
    required this.image,
    required this.location,
    required this.guideName,
    required this.guideImage,
    required this.isWide,
    required this.isFinish,
    required this.isChat,
    required this.isDetail,
    required this.isPay,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyTripsCardState();
}

class _MyTripsCardState extends State<MyTripsCard> {
  bool _isFinished = false; // State to track if the trip is marked finished.

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Image section
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Image.asset(
                  widget.image,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Mark Finished button
              Visibility(
                visible: widget.isFinish, // Ẩn nút khi widget.isFinish là true
                child: Positioned(
                  top: 10,
                  left: 10,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _isFinished = !_isFinished;
                      });
                    },
                    icon: Icon(
                      _isFinished ? Icons.check_circle : Icons.check_circle_outline,
                      color: Colors.white,
                    ),
                    label: Text(
                      _isFinished ? 'Finished' : 'Mark Finished',
                      style: const TextStyle(fontSize: 12),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
              ),
              // Location text
              Positioned(
                bottom: 10,
                left: 10,
                child: Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.white),
                    Text(
                      widget.location,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              // Floating image

            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none, // Đảm bảo ảnh không bị cắt bớt
                  children: [
                    // Title and floating image
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Date and Time
                        Row(
                          children: [
                            const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                            const SizedBox(width: 8),
                            Text(widget.date, style: const TextStyle(color: Colors.grey)),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.access_time, size: 16, color: Colors.grey),
                            const SizedBox(width: 8),
                            Text(widget.time, style: const TextStyle(color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // Guide info
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.account_circle_outlined),
                            const SizedBox(width: 8),
                            Text(widget.guideName),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // Detail button
                        Row(
                          children: [
                            // Button at the start
                            Visibility(
                              visible: widget.isDetail,
                              child: TextButton(
                                onPressed: () {
                                  // Handle detail button action
                                },
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  side: BorderSide(color: Colors.teal),
                                ),
                                child: const Text(
                                  'Detail',
                                  style: TextStyle(color: Colors.teal),
                                ),
                              ),
                            ),
                            Spacer(),
                            // Button at the center
                            Visibility(
                              visible: widget.isChat,
                              child: TextButton(
                                onPressed: () {
                                  // Handle detail button action
                                },
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  side: BorderSide(color: Colors.teal),
                                ),
                                child: const Text(
                                  'Chat',
                                  style: TextStyle(color: Colors.teal),
                                ),
                              ),
                            ),
                            Spacer(),
                            // Button at the end
                            Visibility(
                              visible: widget.isPay,
                              child: TextButton(
                                onPressed: () {
                                  // Handle detail button action
                                },
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  side: BorderSide(color: Colors.teal),
                                ),
                                child: const Text(
                                  'Pay',
                                  style: TextStyle(color: Colors.teal),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      right: 5,
                      top: 5,
                      child: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle, // Tạo hình tròn cho ảnh
                          border: Border.all(
                            color: Color(0xFF00CEA6), // Màu viền
                            width: 3, // Độ dày của viền
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            "assets/images/Tuan Tran 1.png",
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover, // Đảm bảo ảnh phủ đầy hình tròn
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )


        ],
      ),
    );
  }
}
