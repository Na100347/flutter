import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/modeltour.dart';
import 'package:flutter_application_1/mytrips_current.dart';
import 'package:flutter_application_1/services/api_service.dart';

import 'chat_screen.dart';
import 'notifications_screen.dart';
import 'profile_screen.dart';



class MainScreen extends StatelessWidget {
  const MainScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(

        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false, // Ẩn nút quay lại mặc định
            pinned: false, // Để AppBar ẩn khi cuộn
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
                          'Explore',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontFamily: 'Georgia',
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/Location Pin 2 1.png',
                              width: 30,
                              height: 30,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Da Nang',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
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
          // Add input field here
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Stack(
                children: [
                  Container(
                     // Chiều cao tổng thể của vùng chứa
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.black26, // Màu bóng
                          blurRadius: 10, // Độ mờ của bóng
                          offset: Offset(0, 4), // Vị trí bóng
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 100, // Di chuyển TextField lên trên Container
                    left: 1,
                    right: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          const BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Hi, where do you want to explore?',
                          prefixIcon: const Icon(Icons.search, color: Colors.grey),
                          border: InputBorder.none, // Xóa viền mặc định
                          contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                // Top Journeys Section
                const SectionTitle(title: "Top Journeys"),
                SizedBox(
                  height: 266,
                  width: 232,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      JourneyCard(
                        title: "Đà Nẵng - Ba Na - Hội An",
                        subTitle: "Jan 30, 2020",
                        price: "\$400.00",
                        image: "assets/images/journey1.png",
                        imageHeight: 135,
                        imageWidth: 232,
                        isWide: false,
                      ),
                      JourneyCard(
                        title: "Đà Nẵng - Hội An",
                        subTitle: "Feb 20, 2020",
                        price: "\$500.00",
                        image: "assets/images/journey2.png",
                        imageHeight: 135,
                        imageWidth: 232,
                        isWide: false,
                      ),
                      JourneyCard(
                        title: "Thái Lan",
                        subTitle: "5 ngày, 4 đêm",
                        price: "\$600.00",
                        image: "assets/images/journey2.png",
                        imageHeight: 135,
                        imageWidth: 232,
                        isWide: false,
                      ),
                      JourneyCard(
                        title: "Nhật Bản",
                        subTitle: "7 ngày, 6 đêm",
                        price: "\$1000.00",
                        image: "assets/images/journey2.png",
                        imageHeight: 135,
                        imageWidth: 232,
                        isWide: false,
                      ),
                    ],
                  ),
                ),
                // Best Guides Section
                const SectionTitle(title: "Best Guides", seeMore: true),
                Flexible(

              child:GridView.count(
              shrinkWrap: true, // Kích thước của GridView sẽ tự động vừa với nội dung
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2, // Hiển thị 2 card trên 1 hàng
              crossAxisSpacing: 8, // Khoảng cách giữa các card theo chiều ngang
              mainAxisSpacing: 8, // Khoảng cách giữa các card theo chiều dọc
              padding: const EdgeInsets.all(8),
              children: [
                const GuideCard(
                  name: "Tuan Tran",
                  location: "Đà Nẵng, Việt Nam",
                  image: "assets/images/Tuan Tran 1.png",
                ),

                const GuideCard(
                  name: "Emmy",
                  location: "Hội An, Việt Nam",
                  image: "assets/images/Emmy 1.png",
                ),

                const GuideCard(
                  name: "Emmy",
                  location: "Hội An, Việt Nam",
                  image: "assets/images/Emmy 1.png",
                ),
                const GuideCard(
                  name: "Tuan Tran",
                  location: "Đà Nẵng, Việt Nam",
                  image: "assets/images/Tuan Tran 1.png",
                ),

                const GuideCard(
                  name: "Emmy",
                  location: "Hội An, Việt Nam",
                  image: "assets/images/Emmy 1.png",
                ),
              ],
              ),
            ),
                const SizedBox(height: 10),    // Top Experiences Section





                const SectionTitle(title: "Top Experiences"),
                SizedBox(
                  height: 342, // Đặt chiều cao cho ListView ngang
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      ExperienceCard(
                        title: "2 Hour Bicycle Tour exploring Hoian",
                        location: "Hoi An, Vietnam",
                        image: "assets/images/hoian 1.png",
                        userimage: "assets/images/Tuan Tran 1.png",
                        username: "Tuan",
                      ),
                      ExperienceCard(
                        title: "1 day at Bana Hill",
                        location: "Bana, Vietnam",
                        image: "assets/images/Mask Group.png",
                        userimage: "assets/images/Tuan Tran 1.png",
                        username: "Tuan",
                      ),
                    ],
                  ),
                ),





                // Featured Tours Section
                const SectionTitle(title: "Featured Tours", seeMore: true),
                // const JourneyCard(
                //   title: "Da Nang - Ba Na - Hoi An",
                //   subTitle: "Jan 30,2020",
                //   price: "\$400.00",
                //   image: "assets/images/Da Nang - Ba Na - Hoi An.png",
                //   imageHeight: 135,
                //   imageWidth: double.infinity,
                //   isWide: true,

                // ),
                // const JourneyCard(
                //   title: "Melbourne - Sydney",
                //   subTitle: "Jan 30,2020",
                //   price: "\$600.00",
                //   image: "assets/images/Melbourne - Sydney.png",
                //   imageHeight: 135,
                //   imageWidth:double.infinity ,
                //   isWide: true,
                // ),
                // const JourneyCard(
                //   title: "Hanoi - Ha Long Bay",
                //   subTitle: "Jan 30,2020",
                //   price: "\$300.00",
                //   image: "assets/images/Hanoi - Ha Long Bay.png",
                //   imageHeight: 135,
                //   imageWidth:double.infinity ,
                //   isWide: true,
                // ),
                FutureBuilder<List<Tour>>(
  future: ApiService().fetchTours(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text("Failed to load tours: ${snapshot.error}"));
    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return const Center(child: Text("No tours available"));
    } else {
      final tours = snapshot.data!; // Danh sách tour từ API
      return SingleChildScrollView(  
        child: Column(
          children: tours.map((tour) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,   
                child: JourneyCard(
                  title: tour.title,
                  subTitle: tour.dateAvailable.toIso8601String().split('T').first,
                  price: "\$${tour.price}",
                  image: 'assets/images/${tour.title}.png',
                  imageHeight: 200,
                  imageWidth: double.infinity,
                  isWide: true,
                ),
              ),
            );
          }).toList(),
        ),
      );
    }
  },
),




    


                

                const SectionTitle(title: "Travel News", seeMore: false),
                const TravelNewsCard(
                  title: 'New Destination in Danang City',
                  date: 'Feb 5, 2020',
                  image: 'assets/images/New Destination in Danang City.png',

                ),
                const TravelNewsCard(
                  title: "1 Flight Ticket",
                  date: 'Feb 5, 2020',
                  image: 'assets/images/1 Flight Ticket.png',

                ),
                const TravelNewsCard(
                  title: 'Visit Korea in this Tet Holiday',
                  date: 'Feb 5, 2020',
                  image: 'assets/images/Visit Korea in this Tet Holiday.png',

                ),

              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: GestureDetector(
                  onTap: () {
                    // Điều hướng đến màn hình MainScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                    );
                  },
                  child: Image.asset(
                    "assets/images/Explore-Active.png",
                    fit: BoxFit.contain,
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MytripsCurrent(),
                      ),
                    );
                  },
                  child: Image.asset(
                    "assets/images/Trips-Inactive.png",
                    fit: BoxFit.contain,
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
            ),


            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: GestureDetector(
                  onTap: () {
                    // Điều hướng đến màn hình MainScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatScreen(),
                      ),
                    );
                  },
                  child: Image.asset(
                    "assets/images/Chat-Inactive.png",
                    fit: BoxFit.contain,
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
            ),

            // Mục "Notifications"
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: GestureDetector(
                  onTap: () {
                    // Điều hướng đến màn hình MainScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationsScreen(),
                      ),
                    );
                  },
                  child: Image.asset(
                    "assets/images/Notifications-Inactive.png",
                    fit: BoxFit.contain,
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
            ),
            // Mục "Profile"
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: GestureDetector(
                  onTap: () {
                    // Điều hướng đến màn hình MainScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  },
                  child: Image.asset(
                    "assets/images/Profile-Inactive.png",
                    fit: BoxFit.contain,
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// SectionTitle widget
class SectionTitle extends StatelessWidget {
  final String title;
  final bool? seeMore;

  const SectionTitle({required this.title, this.seeMore = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        if (seeMore!) TextButton(onPressed: () {}, child: const Text('SEE MORE', style: TextStyle(color: Color(0xFF00CEA6),),)),
      ],
    );
  }
}

// JourneyCard widget
class JourneyCard extends StatefulWidget {
  final String title;
  final String subTitle;
  final String price;
  final String image;
  final double imageHeight;
  final double imageWidth;
  final bool isWide;

  const JourneyCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.image,
    required this.imageHeight,
    required this.imageWidth,
    required this.isWide,
  }) : super(key: key);

  @override
  _JourneyCardState createState() => _JourneyCardState();
}

class _JourneyCardState extends State<JourneyCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.isWide ? 342 : 232,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          const BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  widget.image,
                  height: widget.imageHeight,
                  width: widget.imageWidth,
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                ),
              ),
              const Positioned(
                bottom: 8,
                left: 8,
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 18,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '1247 likes',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Wrap the Text widget in a Flexible widget to ensure it respects the space available
                    Flexible(
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis, // Adds ellipsis if text overflows
                        maxLines: 1, // Restrict the text to one line
                        softWrap: false, // Prevents the text from wrapping onto the next line
                      ),
                    ),
                    // Heart Icon
                    IconButton(
                      icon: Icon(
                        isSelected ? Icons.favorite : Icons.favorite_border, // Toggle between filled and outlined heart
                        color: isSelected ? const Color(0xFF00CEA6) : Colors.grey, // Change color when selected
                      ),
                      onPressed: () {
                        setState(() {
                          isSelected = !isSelected; // Toggle the selection state
                        });
                      },
                    ),
                  ],
                ) ,
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      widget.subTitle,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    // First part (icon and text '3 days')
                    const Row(
                      children: [
                        Icon(Icons.timer, size: 14, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(
                          '3 days',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // Second part (price)
                    Text(
                      widget.price,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.green,
                      ),
                    ),
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
// GuideCard widget
class GuideCard extends StatelessWidget {
  final String name;
  final String location;
  final String image;

  const GuideCard({
    required this.name,
    required this.location,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          const BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                image,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const Positioned(
              bottom: 8,
              left: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 14),
                      Icon(Icons.star, color: Colors.amber, size: 14),
                      Icon(Icons.star, color: Colors.amber, size: 14),
                      Icon(Icons.star, color: Colors.amber, size: 14),
                      Icon(Icons.star_half, color: Colors.amber, size: 14),
                      SizedBox(width: 4),
                    ],
                  ),
                  SizedBox(height: 4), // Space between stars and text
                  Text(
                    "127 Reviews",
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              const Icon(Icons.location_on, color: Colors.green, size: 14),
              const SizedBox(width: 4),
              Text(
                location,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
    );
  }
}

// ExperienceCard widget
class ExperienceCard extends StatelessWidget {
  final String title;
  final String location;
  final String image;
  final String username;
  final String userimage;

  const ExperienceCard({
    required this.title,
    required this.location,
    required this.image,
    required this.username,
    required this.userimage,


  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 206, // Fixed width for each card
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
        ),
        child: Stack(
          children: [
            // The main image
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  image,
                  width: double.infinity,
                  height: 259,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // The Positioned Container with the user image
            Positioned(
              left: 10,
              bottom: 100, // Adjust the position to place it properly over the image
              child: Column(
                children: [
                  // Container for the image with a circular border
                  Container(
                    padding: const EdgeInsets.all(2), // Optional padding for border thickness
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: const Color(0xFF00CEA6),
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(100), // Circular border for image
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        userimage,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover, // Ensures the image fits within the circle
                      ),
                    ),
                  ),
                  const SizedBox(height: 4), // Space between image and text

                  // Separate text for the username without a border
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Padding inside the border
                    decoration: BoxDecoration(
                      color: const Color(0xFF00CEA6), // Background color for the text

                      borderRadius: BorderRadius.circular(8), // Rounded corners for the border
                    ),
                    child: Text(
                      username,
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),


            // Title and location below the image
            Positioned(
              bottom: 20, // Adjust to position it correctly below the image
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),

                child: Row(
                  children: [
                    const Icon(Icons.location_on ,color: Color(0xFF00CEA6), size: 14),
                    const SizedBox(width: 4),
                    Text(location,
                      style: const TextStyle(color: Color(0xFF00CEA6)),
                    )
                  ],


                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TravelNewsCard extends StatelessWidget {
  final String title;
  final String image;
  final String date;

  const TravelNewsCard({
    required this.title,
    required this.image,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 342,
      height: 193,

      child: Card(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today, color: Colors.green, size: 14),
                  const SizedBox(width: 4),
                  Text(
                    date,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  image,
                  width: double.infinity,
                  height: 129, // Adjusted height to fit within the SizedBox
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class HeartCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  HeartCheckbox({required this.value, required this.onChanged});

  @override
  _HeartCheckboxState createState() => _HeartCheckboxState();
}

class _HeartCheckboxState extends State<HeartCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged(!widget.value),
      child: CustomPaint(
        size: const Size(24, 24),
        painter: HeartPainter(isSelected: widget.value),
      ),
    );
  }
}

class HeartPainter extends CustomPainter {
  final bool isSelected;

  HeartPainter({required this.isSelected});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = isSelected ? Colors.red : Colors.grey
      ..style = PaintingStyle.fill;

    final Path path = Path()
      ..moveTo(size.width / 2, size.height)
      ..cubicTo(0, size.height / 2, size.width / 2, 0, size.width, size.height / 2)
      ..cubicTo(size.width * 1.5, 0, size.width, size.height, size.width / 2, size.height)
      ..close();

    canvas.drawPath(path, paint);

    if (isSelected) {
      final Paint tickPaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;

      final Path tickPath = Path()
        ..moveTo(size.width * 0.3, size.height * 0.5)
        ..lineTo(size.width * 0.45, size.height * 0.65)
        ..lineTo(size.width * 0.7, size.height * 0.35);

      canvas.drawPath(tickPath, tickPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

