import 'package:book_readers_app/Color/color.dart';
import 'package:book_readers_app/login/login.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class landingPage extends StatefulWidget {
  const landingPage({super.key});

  @override
  State<landingPage> createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
  int pageIndex = 0;

  List<Widget> _demo = [
    Container(
      height: 300,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 11, top: 50),
            child: Row(
              children: [
                Container(
                  height: 140,
                  width: 90,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.network(
                      'https://i0.wp.com/lezgetreal.com/wp-content/uploads/2021/02/Cover-Buku-Ayah.jpg?resize=533%2C800&ssl=1'),
                ),
                SizedBox(width: 10),
                Container(
                  height: 180,
                  width: 130,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.network(
                      'https://assets-a1.kompasiana.com/items/album/2018/08/18/14ce416308240e90767f9eed91930d1f2bc21207-1-5b784869bde5753b1a0246f2.jpg?t=o&v=410'),
                ),
                SizedBox(width: 10),
                Container(
                  height: 140,
                  width: 90,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.network(
                      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/romantic-novel-cover-design-template-1f302ee20814ee9513506d90de228af7_screen.jpg?ts=1637007743'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Keberagaman Cerita yang akan Kamu\nsukai",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.josefinSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Baca dan Tulis cerita yang menyenangkan",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cabin(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Container(
      height: 300,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 11, top: 50),
            child: Row(
              children: [
                Container(
                  height: 140,
                  width: 90,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.network(
                      'https://i0.wp.com/lezgetreal.com/wp-content/uploads/2021/02/Cover-Buku-Ayah.jpg?resize=533%2C800&ssl=1'),
                ),
                SizedBox(width: 10),
                Container(
                  height: 180,
                  width: 130,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.network(
                      'https://assets-a1.kompasiana.com/items/album/2018/08/18/14ce416308240e90767f9eed91930d1f2bc21207-1-5b784869bde5753b1a0246f2.jpg?t=o&v=410'),
                ),
                SizedBox(width: 10),
                Container(
                  height: 140,
                  width: 90,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.network(
                      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/romantic-novel-cover-design-template-1f302ee20814ee9513506d90de228af7_screen.jpg?ts=1637007743'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Keberagaman Cerita yang akan Kamu\nsukai",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.josefinSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Baca dan Tulis cerita yang menyenangkan",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cabin(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Container(
      height: 300,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 11, top: 50),
            child: Row(
              children: [
                Container(
                  height: 140,
                  width: 90,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.network(
                      'https://i0.wp.com/lezgetreal.com/wp-content/uploads/2021/02/Cover-Buku-Ayah.jpg?resize=533%2C800&ssl=1'),
                ),
                SizedBox(width: 10),
                Container(
                  height: 180,
                  width: 130,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.network(
                      'https://assets-a1.kompasiana.com/items/album/2018/08/18/14ce416308240e90767f9eed91930d1f2bc21207-1-5b784869bde5753b1a0246f2.jpg?t=o&v=410'),
                ),
                SizedBox(width: 10),
                Container(
                  height: 140,
                  width: 90,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.network(
                      'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/romantic-novel-cover-design-template-1f302ee20814ee9513506d90de228af7_screen.jpg?ts=1637007743'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Keberagaman Cerita yang akan Kamu\nsukai",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.josefinSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Baca dan Tulis cerita yang menyenangkan",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cabin(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: hijauTerang,
        child: Column(
          children: [
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: Image.asset(
                      'assets/logo.png',
                      height: 150,
                      width: 150,
                    ),
                  ),
                  Container(
                    child: Text(
                      'Book Readers Apps',
                      style: GoogleFonts.kadwa(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: merah,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    height: 350,
                    width: double.infinity,
                    child: PageView(
                      children: _demo,
                      onPageChanged: (index) {
                        setState(() {
                          pageIndex = index;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CarouselIndicator(
                    height: 7,
                    width: 7,
                    color: Colors.white,
                    activeColor: coklat,
                    count: _demo.length,
                    index: pageIndex,
                    space: 7.0,
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              width: 250,
              margin: EdgeInsets.only(top: 30),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 176, 205, 176),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return const login();
                    }),
                  );
                },
                child: Text(
                  "Bergabung secara Gratis",
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
