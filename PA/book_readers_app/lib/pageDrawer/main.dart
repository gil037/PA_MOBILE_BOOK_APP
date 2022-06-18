import 'package:book_readers_app/page/homePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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
      home: const homePage(),
      theme: themeMode.darkMode ? darkTheme : mainTheme,
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
