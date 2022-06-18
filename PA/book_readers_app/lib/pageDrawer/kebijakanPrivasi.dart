import 'package:book_readers_app/Color/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KebijakanPrivasi extends StatelessWidget {
  KebijakanPrivasi({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kuning,
        title: Text('Kebijakan Privasi'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "KEBIJAKAN PRIVASI\n\n  Kebijakan Privasi kami membatu menjelaskan praktik data kami, termasuk informasi yang kami proses untuk menyediakan Layanan kami.\n Misalnya, Kebijakan Privasi kami membahas mengenai informasi apa yang kami kumpulkan dan bagaimana hal ini memengaruhi anda. Kebijakan Privasi juga menjelaskan langkah-langkah yang kami ambil untuk melindungi aplikasi anda, seperti mengembangkan layanan kami agar pesan yang tersampaikan.\n  Kebijakan Privasi ini dapat diubah sewaktu-waktu, dan kami akan mengirimkan pemberitahuan secara langsung kepada anda.\n",
                      style: GoogleFonts.kanit(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
