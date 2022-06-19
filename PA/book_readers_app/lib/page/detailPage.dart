import 'package:book_readers_app/Color/color.dart';
import 'package:book_readers_app/controller/Firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirestoreController fsc = Get.put(FirestoreController());
  @override
  Widget build(BuildContext context) {
    Widget ItemCard(Judul, Isi) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: hijauTerang,
        ),
        child: ListView(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: firestore.collection('books').snapshots(),
              // stream: firestore.collection('books').snapshots(),
              builder: ((context, snapshot) {
                return snapshot.hasData
                    ? Column(
                        children: snapshot.data!.docs
                            .map(
                              (e) => Container(
                                margin: EdgeInsets.only(
                                    left: 10, right: 10, top: 3),
                                color: Color.fromARGB(255, 168, 219, 168),
                                child: Container(
                                  child: ListTile(
                                    title: Text("${e.get('Judul')}"),
                                    subtitle: Text("${e.get('Isi')}"),
                                    selectedTileColor: hijauTerang,
                                    onTap: () {},
                                  ),
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
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kuning,
        title: Text(
          'Detail',
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
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: hijauTerang,
        ),
        child: ListView(
          children: [
            ItemCard('Judul', 'Isi'),
          ],
        ),
      ),
    );
  }
}
