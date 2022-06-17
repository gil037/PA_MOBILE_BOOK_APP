import 'package:book_readers_app/Color/color.dart';
import 'package:book_readers_app/controller/TextController.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class cari extends StatefulWidget {
  const cari({super.key});

  @override
  State<cari> createState() => _cariState();
}

// ignore: camel_case_types
class _cariState extends State<cari> {
  final FocusNode _carifocus = FocusNode();
  searchController sc = searchController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: hijauTerang,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: sc.CariCTRL,
                  cursorColor: Color.fromARGB(255, 114, 111, 111),
                  focusNode: _carifocus,
                  onFieldSubmitted: (value) {
                    _carifocus.unfocus();
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          sc.CariCTRL.clear();
                        });
                      },
                    ),
                    hintText: 'Cari buku',
                    hintStyle: GoogleFonts.tenorSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 114, 111, 111),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: Colors.white.withOpacity(0.3),
                    filled: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
