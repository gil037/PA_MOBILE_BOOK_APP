import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class favorit extends StatefulWidget {
  const favorit({super.key});

  @override
  State<favorit> createState() => _favoritState();
}

class _favoritState extends State<favorit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Daftar Buku Saya'),
      ),
    );
  }
}
