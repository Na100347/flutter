import 'package:flutter/material.dart';
import 'package:flutter_application_1/sign_in_screen.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    // Lấy kích thước màn hình
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        // Background color
        Container(
          color: Color(0xFF00C6A7), // Teal-like background color
        ),

        // Đặt các ảnh bằng Positioned để điều chỉnh vị trí dựa trên tỷ lệ màn hình
        Positioned(
          left: screenWidth * 0.7, // Điều chỉnh vị trí dựa trên chiều rộng màn hình
          top: screenHeight * 0.05, // Điều chỉnh vị trí dựa trên chiều cao màn hình
          child: Image.asset(
            "assets/images/Vector 5.png",
            width: screenWidth * 0.24,  // Tỷ lệ chiều rộng hình ảnh
            height: screenHeight * 0.05,  // Tỷ lệ chiều cao hình ảnh
          ),
        ),
        Positioned(
          left: screenWidth * -0.03,
          top: screenHeight * 0.12,
          child: Image.asset(
            "assets/images/Vector 2.png",
            width: screenWidth * 0.25,
            height: screenHeight * 0.05,
          ),
        ),
        Positioned(
          left: screenWidth * 0.46,
          top: screenHeight * 0.15,
          child: Image.asset(
            "assets/images/Vector.png",
            width: screenWidth * 0.3,
            height: screenHeight * 0.12,
          ),
        ),
        Positioned(
          left: screenWidth * 0.6,
          top: screenHeight * 0.23,
          child: Image.asset(
            "assets/images/Vector 6.png",
            width: screenWidth * 0.2,
            height: screenHeight * 0.05,
          ),
        ),
        Positioned(
          left: screenWidth * 0.0,
          top: screenHeight * 0.22,
          child: Image.asset(
            "assets/images/Vector 1.png",
            width: screenWidth * 0.55,
            height: screenHeight * 0.2,
          ),
        ),
        Positioned(
          left: screenWidth * 0.74,
          top: screenHeight * 0.68,
          child: Image.asset(
            "assets/images/Vector 7.png",
            width: screenWidth * 0.31,
            height: screenHeight * 0.3,
          ),
        ),
        Positioned(
          left: 0,
          top: screenHeight * 0.9,
          child: Image.asset(
            "assets/images/Vector 4.png",
            width: screenWidth ,
            height: screenHeight * 0.20,
          ),
        ),
        Positioned(
          left: screenWidth * 0.45,
          top: screenHeight * 0.87,
          child: Image.asset(
            "assets/images/hat.png",
            width: screenWidth * 0.25,
            height: screenHeight * 0.06,
          ),
        ),
        Positioned(
          left: screenWidth * 0.12,
          top: screenHeight * 0.75,
          child: Image.asset(
            "assets/images/Group 1.png",
            width: screenWidth * 0.15,
            height: screenHeight * 0.2,
          ),
        ),
        Positioned(
          left: screenWidth * 0.015,
          top: screenHeight * 0.87,
          child: Image.asset(
            "assets/images/Lanho.png",
            width: screenWidth * 0.08,
            height: screenHeight * 0.15,
          ),
        ),
        Positioned(
          left: screenWidth * 0.25,
          top: screenHeight * 0.4,
          child: GestureDetector(
            onTap: () {
              // Điều hướng đến trang khác khi nhấn vào logo
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignInScreen(), // Chuyển đến trang SignInScreen
                ),
              );
            },
            child: Image.asset(
              "assets/images/Logo.png",
              width: screenWidth * 0.55,
              height: screenHeight * 0.12,
            ),
          ),
        ),
      ],
    );
  }
}



// fix cứng
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/sign_in_screen.dart';
//
// class Splash extends StatelessWidget {
//   const Splash({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         // Background color
//         Container(
//           color: Color(0xFF00C6A7), // Teal-like background color
//         ),
//
//         // Đặt các ảnh bằng Positioned để điều chỉnh vị trí
//         Positioned(
//           left: 265,
//           top: 42, // Điều chỉnh vị trí trên
//           child: Image.asset(
//             "assets/images/Vector 5.png",
//             width: 91.26,
//             height: 39.57,// Điều chỉnh kích thước nếu cần
//           ),
//         ),
//         Positioned(
//           left: -10,
//           top: 102, // Điều chỉnh vị trí cho gần với góc trên phải
//           child: Image.asset(
//             "assets/images/Vector 2.png",
//             width: 94.57,
//             height: 34,// Điều chỉnh kích thước nếu cần
//           ),
//         ),
//         Positioned(
//           left: 199,
//           top: 133.23, // Điều chỉnh vị trí cho gần với góc trên phải
//           child: Image.asset(
//             "assets/images/Vector.png",
//             width: 71.92,
//             height: 38.8,// Điều chỉnh kích thước nếu cần
//           ),
//         ),
//         Positioned(
//           left: 227,
//           top: 149, // Điều chỉnh vị trí dưới Vector 1
//           child: Image.asset(
//             "assets/images/Vector 6.png",
//             width: 75,
//             height: 33,// Điều chỉnh kích thước
//           ),
//         ),
//         // Image on the top right (Vector 1)
//         Positioned(
//           left: 0,
//           top: 165,
//           child: Image.asset(
//             "assets/images/Vector 1.png",
//             width: 209,
//             height: 96,// Điều chỉnh kích thước
//           ),
//         ),
//
//         // Image on the top right (Vector 6)
//         Positioned(
//           left: 227,
//           top: 149, // Điều chỉnh vị trí dưới Vector 1
//           child: Image.asset(
//             "assets/images/Vector 6.png",
//             width: 75,
//             height: 33,// Điều chỉnh kích thước
//           ),
//         ),
//
//         // Small image at top-right (Vector)
//         Positioned(
//           left: 278.4,
//           top: 549.68, // Điều chỉnh vị trí dưới Vector 1
//           child: Image.asset(
//             "assets/images/Vector 7.png",
//             width: 115.25,
//             height:218.25 ,// Điều chỉnh kích thước
//           ),
//         ),
//         Positioned(
//           left: 0,
//           top: 692, // Điều chỉnh vị trí dưới Vector 1
//           child: Image.asset(
//             "assets/images/Vector 4.png",
//             width: 376,
//             height:121 ,// Điều chỉnh kích thước
//           ),
//         ),
//         Positioned(
//           left: 175,
//           top: 700, // Điều chỉnh vị trí dưới Vector 1
//           child: Image.asset(
//             "assets/images/hat.png",
//             width: 91.97,
//             height:48.97 ,// Điều chỉnh kích thước
//           ),
//         ),
//         Positioned(
//           left: 45,
//           top: 626.63, // Điều chỉnh vị trí dưới Vector 1
//           child: Image.asset(
//             "assets/images/Group 1.png",
//             width: 52,
//             height:175.37 ,// Điều chỉnh kích thước
//           ),
//         ),
//         Positioned(
//           left: 45,
//           top: 626.63, // Điều chỉnh vị trí dưới Vector 1
//           child: Image.asset(
//             "assets/images/Group 1.png",
//             width: 52,
//             height:175.37 ,// Điều chỉnh kích thước
//           ),
//         ),
//         Positioned(
//           left: 5.92,
//           top: 694.95, // Điều chỉnh vị trí dưới Vector 1
//           child: Image.asset(
//             "assets/images/Lanho.png",
//             width: 31,
//             height:110,// Điều chỉnh kích thước
//           ),
//         ),
//         Positioned(
//           left: 86,
//           top: 356,
//           child: GestureDetector(
//             onTap: () {
//               // Điều hướng đến trang khác khi nhấn vào logo
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const SignInScreen(), // Thay 'NextPage' bằng trang bạn muốn điều hướng tới
//                 ),
//               );
//             },
//             child: Image.asset(
//               "assets/images/Logo.png",
//               width: 205,
//               height: 84.76,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
