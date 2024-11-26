import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/sign_up_screen.dart';
import 'main_screen.dart'; // Import để sử dụng MainScreen

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 150.0,
            floating: false,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipPath(
                clipper: AppBarClipper(),
                child: Container(
                  color: const Color(0xFF00CEA6),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 20,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.asset(
                            "assets/images/Group 3.png",
                          ),
                        ),
                      ),
                      Positioned(
                        right: 80,
                        top: 65,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.asset(
                            "assets/images/Vector 1.png",
                            width: 150,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 120,
                        top: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.asset(
                            "assets/images/Vector 6.png",
                          ),
                        ),
                      ),
                      Positioned(
                        right: 30,
                        top: 20,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.asset(
                            "assets/images/Vector.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SignInBody(),
          ),
        ],
      ),
    );
  }
}

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  _SignInBodyState createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Sign In" ,
                style: TextStyle(fontSize: 30 ,
                fontWeight: FontWeight.bold,
                ),
            ),
            Text(
              "Welcome back, Le Huu Duong" ,
              style: TextStyle(color: Color(0xFF00CEA6),
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              obscureText: true,
              obscuringCharacter: '•',
              style: TextStyle(fontSize: 30.0),
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Forgot Password?",
              style: TextStyle(fontSize: 12.0),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  backgroundColor: Colors.teal,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()), // Chuyển đến MainScreen
                  );
                },
                child: const Text(
                  "SIGN IN",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/Group 9.png",
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    "assets/images/Group 8.png",
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    "assets/images/Group 7.png",
                  ),
                ]

              )
            ),

            const SizedBox(height: 20),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Sign Up",
                      style: const TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()), // Chuyển đến màn hình đăng ký
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            Center(
             
            )
          ],
        ),
      ),
    );
  }
}

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 60, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
