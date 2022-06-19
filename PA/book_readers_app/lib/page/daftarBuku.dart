import 'package:book_readers_app/Color/color.dart';
import 'package:book_readers_app/controller/Firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: hijauTerang,
        ),
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
                                color: Color.fromARGB(255, 168, 219, 168),
                                child: ListTile(
                                  title: Text("${e.get('Judul')}"),
                                  subtitle: Text("${e.get('Author')}"),
                                  trailing: Icon(Icons.favorite),
                                  selectedTileColor: hijauTerang,
                                  onTap: () {},
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
