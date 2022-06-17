import 'package:book_readers_app/Color/color.dart';
import 'package:book_readers_app/login/login.dart';
import 'package:book_readers_app/page/cari.dart';
import 'package:book_readers_app/page/favorit.dart';
import 'package:book_readers_app/page/profile.dart';
import 'package:book_readers_app/page/tulis.dart';
import 'package:book_readers_app/page/utama.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _SecondPageState();
}

class _SecondPageState extends State<homePage> {
  List<BottomNavigationBarItem> navbarItem = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Utama"),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: "Cari"),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorit"),
    BottomNavigationBarItem(
        icon: Icon(Icons.border_color_outlined), label: "Tulis"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int _index = 0;
  List<Widget> _body = [Utama(), cari(), favorit(), tulis(), profile()];

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
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
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
                  CircleAvatar(
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
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text("Profil Saya"),
              subtitle: Text("Account pengguna aplikasi"),
              tileColor: Color.fromARGB(255, 246, 246, 233),
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
                setState(() {
                  _index = 4;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              subtitle: Text("Pengaturan Aplikasi"),
              tileColor: Color.fromARGB(255, 246, 246, 233),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (_) {
                //     return settings();
                //   }),
                // );
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Pemberitahuan"),
              subtitle: Text("Pemberitahuan !"),
              tileColor: Color.fromARGB(255, 246, 246, 233),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (_) {
                //     return pemberitahuan();
                //   }),
                // );
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_support_outlined),
              title: Text("Dukungan"),
              subtitle: Text("Cara penggunaan aplikasi"),
              tileColor: Color.fromARGB(255, 246, 246, 233),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (_) {
                //     return dukungan();
                //   }),
                // );
              },
            ),
            ListTile(
              leading: Icon(Icons.code_rounded),
              title: Text("Kode Promo"),
              subtitle: Text("Kode potongan harga"),
              tileColor: Color.fromARGB(255, 246, 246, 233),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (_) {
                //     return profile();
                //   }),
                // );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings_applications),
              title: Text("Tentang Aplikasi"),
              subtitle: Text("Spesifikasi Aplikasi"),
              tileColor: Color.fromARGB(255, 246, 246, 233),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (_) {
                //     return profile();
                //   }),
                // );
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Kebijakan Privasi"),
              subtitle: Text("Isi dan izin dari aplikasi"),
              tileColor: Color.fromARGB(255, 246, 246, 233),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (_) {
                //     return profile();
                //   }),
                // );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log Out"),
              subtitle: Text("Keluar dari aplikasi"),
              tileColor: Color.fromARGB(255, 246, 246, 233),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return login();
                  }),
                );
              },
            ),
            ListTile(
              title: Text(""),
              tileColor: Color.fromARGB(255, 246, 246, 233),
            ),
          ],
        ),
      ),
      body: _body[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 193, 193, 194),
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
