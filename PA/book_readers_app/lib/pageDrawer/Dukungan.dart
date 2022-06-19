import 'package:book_readers_app/Color/color.dart';
import 'package:book_readers_app/controller/Firebase.dart';
import 'package:book_readers_app/controller/TextController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class dukungan extends StatefulWidget {
  const dukungan({super.key});

  @override
  State<dukungan> createState() => _dukunganState();
}

class _dukunganState extends State<dukungan> {
  FirestoreController fsc = Get.put(FirestoreController());
  DukunganController dc = Get.put(DukunganController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dukungan",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: hijauTerang,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: hijauTua),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(30.0, 30.0, 0.0, 0.0),
              child: Text(
                "Komentar",
                style: GoogleFonts.kanit(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 10.0),
              child: TextFormField(
                controller: dc.KomentarCtrl,
                maxLines: 4,
                // controller: tc.komenCtrl,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  hintText: "Komentar",
                  hintStyle: GoogleFonts.kanit(
                    textBaseline: TextBaseline.ideographic,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 83, 81, 81),
                  ),
                  fillColor: Colors.white.withOpacity(0.5),
                  filled: true,
                ),
                cursorColor: Colors.grey,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30.0, 30.0, 0.0, 0.0),
              child: Text(
                "Saran",
                style: GoogleFonts.kanit(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 10.0),
              child: TextFormField(
                maxLines: 4,
                controller: dc.SaranCtrl,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  hintText: "Saran",
                  hintStyle: GoogleFonts.kanit(
                    textBaseline: TextBaseline.ideographic,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 83, 81, 81),
                  ),
                  fillColor: Colors.white.withOpacity(0.5),
                  filled: true,
                ),
                cursorColor: Colors.grey,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 15, 40, 0),
              width: 315,
              height: 45,
              child: ElevatedButton(
                // tombol order
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 246, 246, 233),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  fsc.dukungan.value.add({
                    "komentar": dc.KomentarCtrl.text,
                    "saran": dc.SaranCtrl.text,
                  });
                  CustomAlert(
                      context, "NOTIFIKASI !", "Ulasan Diterima Terima Kasih");
                  dc.KomentarCtrl.clear();
                  dc.SaranCtrl.clear();
                },
                child: Text(
                  "Kirim",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'RussoOne'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<dynamic> CustomAlert(
    BuildContext context, String title, String content) {
  return showDialog<dynamic>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
