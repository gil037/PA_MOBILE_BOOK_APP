import 'package:book_readers_app/login/login.dart';
import 'package:book_readers_app/page/homePage.dart';
import 'package:book_readers_app/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      ChangeNotifierProvider(create: (context) => DarkMode(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  var mainTheme = ThemeData.light();
  var darkTheme = ThemeData.dark();

  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<DarkMode>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const homePage(),
      theme: themeMode.darkMode ? mainTheme : darkTheme,
    );
  }
}

class DarkMode with ChangeNotifier {
  bool darkMode = true;

  ///by default it is true
  ///made a method which will execute while switching
  changeMode() {
    darkMode = !darkMode;
    notifyListeners();

    ///notify the value or update the widget value
  }
}
