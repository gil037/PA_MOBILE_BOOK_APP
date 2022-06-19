import 'package:book_readers_app/Color/color.dart';
import 'package:book_readers_app/controller/Firebase.dart';
import 'package:book_readers_app/page/detailPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class favorit extends StatefulWidget {
  const favorit({super.key});

  @override
  State<favorit> createState() => _favoritState();
}

class _favoritState extends State<favorit> {
  FirestoreController fsc = Get.put(FirestoreController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
    );
  }
}
