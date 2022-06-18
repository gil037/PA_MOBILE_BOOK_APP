import 'package:book_readers_app/Color/color.dart';
import 'package:book_readers_app/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kuning,
        title: const Text("Mode Gelap"),
      ),
      body: const _Settings(),
    );
  }
}

class _Settings extends StatefulWidget {
  const _Settings({Key? key}) : super(key: key);

  @override
  State<_Settings> createState() => _SettingsState();
}

class _SettingsState extends State<_Settings> {
  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<DarkMode>(context);
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.dark_mode, size: 35),
                title: const Text("Dark Mode"),
                subtitle: const Text("Here you can change you're theme."),
                trailing: Switch(
                  value: themeMode.darkMode,
                  activeTrackColor: const Color.fromARGB(255, 89, 216, 255),
                  activeColor: const Color.fromARGB(255, 78, 76, 175),
                  onChanged: (value) {
                    themeMode.changeMode();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
