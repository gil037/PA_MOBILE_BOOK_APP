import 'dart:convert';
import 'dart:io';

import 'package:book_readers_app/Color/color.dart';
import 'package:book_readers_app/controller/TextController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

String? filename;
File? image;

class tulis extends StatefulWidget {
  const tulis({super.key});

  @override
  State<tulis> createState() => _tulisState();
}

class _tulisState extends State<tulis> {
  Widget coverEmpty() {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 20, right: 10, bottom: 10),
      height: 200,
      width: 120,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        color: Colors.black12,
      ),
      child: IconButton(
        splashRadius: 10,
        icon: const Icon(
          Icons.add_a_photo,
          size: 50,
          color: Colors.white,
        ),
        onPressed: () {
          takePhoto(ImageSource.gallery).then((File? file) {
            setState(() {
              image = file;
              Navigator.pop(this.context);
            });
          });
        },
      ),
    );
  }

  Widget cover() {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 20, right: 10, bottom: 10),
      height: 200,
      width: 120,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: FileImage(image!),
          fit: BoxFit.cover,
        ),
      ),
      child: IconButton(
        color: kuning,
        padding: const EdgeInsets.only(right: 80, top: 160),
        onPressed: () {
          takePhoto(ImageSource.gallery).then((File? file) {
            setState(() {
              image = file;
              Navigator.pop(this.context);
            });
          });
        },
        icon: const Icon(
          Icons.update_sharp,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }

  final ImagePicker _picker = ImagePicker();

  Future<File?> takePhoto(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    final File file = File(image!.path);
    return file;
  }

  final FocusNode _deskripsiFocus = FocusNode();
  final FocusNode _judulFocus = FocusNode();
  final FocusNode _isiFocus = FocusNode();
  final FocusNode _AuthorFocus = FocusNode();
  tulisController tc = tulisController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Form(
        key: _formKey,
        child: Scaffold(
          body: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: hijauTerang,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          image == null ? coverEmpty() : cover(),
                          Container(
                            height: 192,
                            width: MediaQuery.of(context).size.width - 170,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                TextFormField(
                                  maxLines: 2,
                                  controller: tc.JudulCtrl,
                                  focusNode: _judulFocus,
                                  onFieldSubmitted: (value) {
                                    _judulFocus.unfocus();
                                  },
                                  cursorColor:
                                      const Color.fromARGB(255, 176, 205, 176),
                                  decoration: InputDecoration(
                                    floatingLabelStyle: GoogleFonts.kanit(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: const Color.fromARGB(
                                          255, 114, 111, 111),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 114, 111, 111),
                                      ),
                                    ),
                                    hintText: "Judul",
                                    hintStyle: GoogleFonts.kanit(
                                      textBaseline: TextBaseline.ideographic,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromARGB(255, 83, 81, 81),
                                    ),
                                    fillColor: Colors.white.withOpacity(0.3),
                                    filled: false,
                                  ),
                                  style: GoogleFonts.kanit(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        const Color.fromARGB(255, 48, 48, 48),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Judul tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  maxLines: 2,
                                  maxLength: 70,
                                  controller: tc.DeskripsiCtrl,
                                  focusNode: _deskripsiFocus,
                                  onFieldSubmitted: (value) {
                                    _deskripsiFocus.unfocus();
                                  },
                                  cursorColor:
                                      const Color.fromARGB(255, 176, 205, 176),
                                  decoration: InputDecoration(
                                    floatingLabelStyle: GoogleFonts.kanit(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: const Color.fromARGB(
                                          255, 114, 111, 111),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 114, 111, 111),
                                      ),
                                    ),
                                    hintText: "Deksripsi",
                                    hintStyle: GoogleFonts.kanit(
                                      textBaseline: TextBaseline.ideographic,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromARGB(255, 83, 81, 81),
                                    ),
                                    fillColor: Colors.white.withOpacity(0.3),
                                    filled: false,
                                  ),
                                  style: GoogleFonts.kanit(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        const Color.fromARGB(255, 48, 48, 48),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Deskripsi tidak boleh kosong';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 34,
                                  width:
                                      MediaQuery.of(context).size.width - 180,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      // Foreground color
                                      onPrimary: Colors.white,
                                      // Background color
                                      primary: Colors.amber,
                                    ),
                                    child: Text(
                                      'Upload Cover',
                                      style: GoogleFonts.kanit(
                                        letterSpacing: 1,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onPressed: () {
                                      uploadImage();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width - 10,
                        color: Colors.black.withOpacity(0.3),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: TextFormField(
                          maxLength: 20,
                          textAlign: TextAlign.justify,
                          controller: tc.AuthorCtrl,
                          focusNode: _AuthorFocus,
                          onFieldSubmitted: (value) {
                            _AuthorFocus.unfocus();
                          },
                          cursorColor: const Color.fromARGB(255, 176, 205, 176),
                          decoration: InputDecoration(
                            floatingLabelStyle: GoogleFonts.kanit(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 114, 111, 111),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 114, 111, 111),
                              ),
                            ),
                            hintText: "Author",
                            hintStyle: GoogleFonts.kanit(
                              textBaseline: TextBaseline.ideographic,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 83, 81, 81),
                            ),
                            fillColor: Colors.white.withOpacity(0.3),
                            filled: false,
                          ),
                          style: GoogleFonts.kanit(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 48, 48, 48),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        child: TextFormField(
                          maxLines: 30,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(20000),
                          ],
                          textAlign: TextAlign.justify,
                          controller: tc.IsiCtrl,
                          focusNode: _isiFocus,
                          onFieldSubmitted: (value) {
                            _isiFocus.unfocus();
                          },
                          cursorColor: const Color.fromARGB(255, 176, 205, 176),
                          decoration: InputDecoration(
                            floatingLabelStyle: GoogleFonts.kanit(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 114, 111, 111),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 114, 111, 111),
                              ),
                            ),
                            hintText: "isi cerita",
                            hintStyle: GoogleFonts.kanit(
                              textBaseline: TextBaseline.ideographic,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 83, 81, 81),
                            ),
                            fillColor: Colors.white.withOpacity(0.3),
                            filled: false,
                          ),
                          style: GoogleFonts.kanit(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 48, 48, 48),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 20, right: 5),
                            height: 40,
                            width: MediaQuery.of(context).size.width / 2,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                // Foreground color
                                onPrimary: Colors.white,
                                // Background color
                                primary: coklat,
                              ),
                              child: Text(
                                'Kirim',
                                style: GoogleFonts.kanit(
                                  letterSpacing: 1,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 5, right: 20),
                            height: 40,
                            width: MediaQuery.of(context).size.width / 2,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                // Foreground color
                                onPrimary: Colors.white,
                                // Background color
                                primary: merah,
                              ),
                              child: Text(
                                'Reset',
                                style: GoogleFonts.kanit(
                                  letterSpacing: 1,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                tc.JudulCtrl.clear();
                                tc.DeskripsiCtrl.clear();
                                tc.IsiCtrl.clear();
                                tc.AuthorCtrl.clear();
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<String> uploadImage() async {
    TaskSnapshot taskSnapshot = await FirebaseStorage.instance
        .ref()
        .child("profile")
        .child(FirebaseAuth.instance.currentUser?.uid ?? basename(image!.path))
        .putFile(image!);

    return taskSnapshot.ref.getDownloadURL();
  }
}
