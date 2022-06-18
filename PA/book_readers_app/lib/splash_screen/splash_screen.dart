import 'package:book_readers_app/landing_page/landingPage.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Container(
            height: 190,
            width: 190,
            margin: EdgeInsets.only(top: 150),
            child: Image(
              image: AssetImage("assets/logo.png"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'Welcome !',
              style: TextStyle(
                  fontFamily: 'Atma',
                  fontSize: 40,
                  color: Color.fromARGB(255, 114, 111, 111)),
            ),
          ),
          Text(
            '         Tempat Cerita Menjadi Hidup\nJadilah bagian dari Komunitas Global',
            style: TextStyle(
                fontFamily: 'Atma',
                fontWeight: FontWeight.w600,
                wordSpacing: 2.0,
                fontSize: 15,
                color: Color.fromARGB(255, 237, 123, 107)),
          ),
        ],
      ),
      splashIconSize: 700,
      duration: 3000,
      splashTransition: SplashTransition.sizeTransition,
      backgroundColor: Color.fromARGB(255, 255, 211, 89),
      nextScreen: const landingPage(),
    );
  }
}
