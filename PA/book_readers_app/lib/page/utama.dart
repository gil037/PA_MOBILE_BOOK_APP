import 'package:book_readers_app/Color/color.dart';
import 'package:book_readers_app/controller/Firebase.dart';
import 'package:book_readers_app/page/detailPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';

FirestoreController fsc = Get.put(FirestoreController());

class Utama extends StatefulWidget {
  const Utama({super.key});

  @override
  State<Utama> createState() => _utamaState();
}

class _utamaState extends State<Utama> {
  int pageIndex = 0;

  List<Widget> _demo = [
    Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Pergi',
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            height: 160,
            width: 380,
            child: Image.network(
              'https://assets-a1.kompasiana.com/items/album/2018/08/18/14ce416308240e90767f9eed91930d1f2bc21207-1-5b784869bde5753b1a0246f2.jpg?t=o&v=410',
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    ),
    Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Ayah',
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            height: 160,
            width: 380,
            child: Image.network(
              'https://i0.wp.com/lezgetreal.com/wp-content/uploads/2021/02/Cover-Buku-Ayah.jpg?resize=533%2C800&ssl=1',
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    ),
    Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Love in the Fast Lane',
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            height: 160,
            width: 380,
            child: Image.network(
              'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/romantic-novel-cover-design-template-1f302ee20814ee9513506d90de228af7_screen.jpg?ts=1637007743',
              fit: BoxFit.fitWidth,
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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: hijauTerang,
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    height: 241,
                    width: double.infinity,
                    child: PageView(
                      reverse: false,
                      children: _demo,
                      onPageChanged: (index) {
                        setState(() {
                          pageIndex = index;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width - 10,
              color: Colors.black.withOpacity(0.3),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 10,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          'Daftar Buku',
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(
                            Icons.filter_list,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 2,
                    width: MediaQuery.of(context).size.width - 10,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),
            ),
            Container(
              height: 500 - 203,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: fsc.books.value.snapshots(),
                    builder: ((context, snapshot) {
                      return snapshot.hasData
                          ? Column(
                              children: snapshot.data!.docs
                                  .map(
                                    (e) => Container(
                                      margin: EdgeInsets.only(
                                          left: 10, right: 10, top: 3),
                                      color: Color.fromRGBO(168, 219, 168, 1),
                                      child: ListTile(
                                        title: Text("${e.get('Judul')}"),
                                        subtitle: Text("${e.get('Author')}"),
                                        trailing: TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (_) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (_) => Detail(
                                                          Judul: e.get('Judul'),
                                                          Isi: e.get('Isi'),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              }),
                                            );
                                          },
                                          child: Text(
                                            'Read More',
                                            style: GoogleFonts.actor(
                                              fontSize: 12,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        selectedTileColor: hijauTerang,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (_) {
                                              return GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (_) => Detail(
                                                        Judul: e.get('Judul'),
                                                        Isi: e.get('Isi'),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                  .toList(),
                            )
                          : Center(
                              child: Text('Daftar Buku Saya'),
                            );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
