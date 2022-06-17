import 'package:book_readers_app/landing_page/landingPage.dart';
import 'package:book_readers_app/page/cerita.dart';
import 'package:book_readers_app/page/homePage.dart';
import 'package:book_readers_app/page/tulis.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:book_readers_app/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: homePage(),
    );
  }
}
