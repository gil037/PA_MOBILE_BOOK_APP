import 'package:book_readers_app/Color/color.dart';
import 'package:book_readers_app/login/login.dart';
import 'package:book_readers_app/page/cari.dart';
import 'package:book_readers_app/page/daftarBuku.dart';
import 'package:book_readers_app/page/profile.dart';
import 'package:book_readers_app/page/tulis.dart';
import 'package:book_readers_app/page/utama.dart';
import 'package:book_readers_app/pageDrawer/Dukungan.dart';
import 'package:book_readers_app/pageDrawer/Theme.dart';
import 'package:book_readers_app/pageDrawer/pemberitahuan.dart';
import 'package:book_readers_app/pageDrawer/tentangAplikasi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pageDrawer/kebijakanPrivasi.dart';

// ignore: camel_case_types
class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _SecondPageState();
}

class _SecondPageState extends State<homePage> {
  List<BottomNavigationBarItem> navbarItem = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Utama"),
    const BottomNavigationBarItem(icon: Icon(Icons.search), label: "Cari"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.book_online), label: "Daftar Buku"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.border_color_outlined), label: "Tulis"),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int _index = 0;
  final List<Widget> _body = [
    const Utama(),
    const cari(),
    const favorit(),
    const tulis(),
    const profile()
  ];
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: kuning,
        title: Text(
          'Halaman Utama',
          textAlign: TextAlign.justify,
          style: GoogleFonts.adventPro(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        actions: [
          Builder(builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              icon: Image.asset('assets/logo.png'),
              iconSize: 10,
            );
          })
        ],
        // leading: Builder(builder: (BuildContext context) {
        //   return IconButton(
        //     onPressed: () {
        //       Scaffold.of(context).openDrawer();
        //     },
        //     tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        //     icon: Image.asset('assets/logo.png'),
        //     iconSize: 10,
        //   );
        // }),
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: Container(
          color: kuning,
          child: Column(
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                child: DrawerHeader(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://i.pinimg.com/564x/98/56/a1/9856a11dc5c3605d726ea1bce81f8164.jpg'),
                    ),
                  ),
                  // decoration: BoxDecoration(color: Colors.grey.shade500),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://i.pinimg.com/originals/2f/d8/3e/2fd83e5a7d7b76cd846365796cd979bc.png'),
                        radius: 50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Tom Cruise',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 25.0),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'tomcruise@gmail.com',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 14.0),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text("Profil Saya"),
                subtitle: const Text("Account pengguna aplikasi"),
                tileColor: const Color.fromARGB(255, 246, 246, 233),
                onTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                  setState(() {
                    _index = 4;
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text("Pemberitahuan"),
                subtitle: const Text("Pemberitahuan !"),
                tileColor: const Color.fromARGB(255, 246, 246, 233),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return Pemberitahuan();
                    }),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.contact_support_outlined),
                title: const Text("Dukungan"),
                subtitle: const Text("Cara penggunaan aplikasi"),
                tileColor: const Color.fromARGB(255, 246, 246, 233),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return const dukungan();
                    }),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings_applications),
                title: const Text("Tentang Aplikasi"),
                subtitle: const Text("Spesifikasi Aplikasi"),
                tileColor: const Color.fromARGB(255, 246, 246, 233),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return TentangAplikasi(
                        title: 'Tentang Aplikasi',
                      );
                    }),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text("Kebijakan Privasi"),
                subtitle: const Text("Isi dan izin dari aplikasi"),
                tileColor: const Color.fromARGB(255, 246, 246, 233),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return KebijakanPrivasi();
                    }),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.opacity),
                title: const Text("Mode Gelap"),
                subtitle: const Text("Aktif atau tidak"),
                tileColor: const Color.fromARGB(255, 246, 246, 233),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return const Settings();
                    }),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Log Out"),
                subtitle: const Text("Keluar dari aplikasi"),
                tileColor: const Color.fromARGB(255, 246, 246, 233),
                onTap: () {
                  auth.signOut();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => login()));
                },
              ),
            ],
          ),
        ),
      ),
      body: _body[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 193, 193, 194),
        currentIndex: _index,
        selectedItemColor: kuning,
        unselectedItemColor: Colors.grey,
        items: navbarItem,
        onTap: (i) {
          setState(() {
            _index = i;
          });
        },
      ),
    );
  }
}
