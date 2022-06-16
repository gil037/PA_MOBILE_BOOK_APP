import 'package:book_readers_app/Color/color.dart';
import 'package:book_readers_app/controller/TextController.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class tulis extends StatefulWidget {
  const tulis({super.key});

  @override
  State<tulis> createState() => _tulisState();
}

class _tulisState extends State<tulis> {
  late File file;
  TextEditingController _textEditingController = TextEditingController();
  final FocusNode _tulisFocus = FocusNode();
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
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Row(
                  children: [
                    file != null
                        ? Container(
                            margin: EdgeInsets.only(
                                left: 20, top: 20, right: 10, bottom: 20),
                            height: 150,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.image),
                              onPressed: () {
                                chooseImage();
                              },
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.only(
                                left: 20, top: 20, right: 10, bottom: 20),
                            height: 150,
                            width: 100,
                            child: ElevatedButton(
                              child: Image.file(File(file.path)),
                              onPressed: (() {
                                updateProfile(context);
                              }),
                            )),
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width - 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            maxLines: 2,
                            controller: tc.JudulCtrl,
                            focusNode: _tulisFocus,
                            onFieldSubmitted: (value) {
                              _tulisFocus.unfocus();
                            },
                            cursorColor: Color.fromARGB(255, 176, 205, 176),
                            decoration: InputDecoration(
                              floatingLabelStyle: GoogleFonts.kanit(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 114, 111, 111),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 114, 111, 111),
                                ),
                              ),
                              hintText: "Judul",
                              hintStyle: GoogleFonts.kanit(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 114, 111, 111),
                              ),
                              fillColor: Colors.white.withOpacity(0.3),
                              filled: false,
                            ),
                            style: GoogleFonts.kanit(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 114, 111, 111),
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
                            focusNode: _tulisFocus,
                            onFieldSubmitted: (value) {
                              _tulisFocus.unfocus();
                            },
                            cursorColor: Color.fromARGB(255, 176, 205, 176),
                            decoration: InputDecoration(
                              floatingLabelStyle: GoogleFonts.kanit(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 114, 111, 111),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 114, 111, 111),
                                ),
                              ),
                              hintText: "Deksripsi",
                              hintStyle: GoogleFonts.kanit(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 114, 111, 111),
                              ),
                              fillColor: Colors.white.withOpacity(0.3),
                              filled: false,
                            ),
                            style: GoogleFonts.kanit(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 114, 111, 111),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Deskripsi tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  height: 30,
                  width: MediaQuery.of(context).size.width,
                  color: kuning,
                  child: ElevatedButton(
                    child: Text('Upload'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        uploadImage();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  chooseImage() async {
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    print("file " + xfile!.path);
    file = File(xfile.path);
    setState(() {});
  }

  updateProfile(BuildContext context) async {
    Map<String, dynamic> map = Map();
    if (file != null) {
      String url = await uploadImage();
      map['profileImage'] = url;
    }
    map['name'] = _textEditingController.text;

    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(map);
    Navigator.pop(context);
  }

  Future<String> uploadImage() async {
    TaskSnapshot taskSnapshot = await FirebaseStorage.instance
        .ref()
        .child("profile")
        .child(
            FirebaseAuth.instance.currentUser!.uid + "_" + basename(file.path))
        .putFile(file);

    return taskSnapshot.ref.getDownloadURL();
  }
}
