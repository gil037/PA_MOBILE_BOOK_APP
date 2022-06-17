import 'package:book_readers_app/Color/color.dart';
import 'package:book_readers_app/controller/TextController.dart';
import 'package:book_readers_app/page/homePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as sliderPopup;
import 'package:google_fonts/google_fonts.dart';
import 'package:passwordfield/passwordfield.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  late ProgressDialog pr;
  final _formKey = GlobalKey<FormState>();
  final RegisterController rc = Get.put(RegisterController());

  void _showDialog() {
    sliderPopup.showSlideDialog(
      context: context,
      barrierColor: Colors.transparent,
      pillColor: Colors.white,
      backgroundColor: Color.fromARGB(255, 234, 223, 180),
      child: Expanded(
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                Container(
                  child: Text(
                    'Register',
                    style: GoogleFonts.kanit(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  height: 380,
                  width: 380,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color.fromARGB(255, 65, 65, 65).withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                  child: ListView(
                    children: [
                      MyTextField(
                        labelText: "Nama Depan",
                        controller: rc.namaDepanCtrl,
                      ),
                      MyTextField(
                        labelText: "Nama Belakang",
                        controller: rc.namaBelakangCtrl,
                      ),
                      MyTextField(
                        labelText: "Username",
                        controller: rc.usernameCtrl,
                      ),
                      MyTextField(
                        labelText: "Password",
                        controller: rc.passwordCtrl,
                      ),
                      MyTextField(
                        labelText: "Konfirmasi Password",
                        controller: rc.konfirmasiPasswordCtrl,
                      ),
                      MyTextField(
                        labelText: "Nomor HP",
                        controller: rc.nomorTeleponCtrl,
                        keyboardType: TextInputType.number,
                      ),
                      // Container(
                      //   padding: EdgeInsets.only(
                      //       left: 15, right: 15, bottom: 5, top: 10),
                      //   child: TextField(
                      //     controller: rc.namaDepanCtrl,
                      //     cursorColor: Color.fromARGB(255, 176, 205, 176),
                      //     decoration: InputDecoration(
                      //       floatingLabelStyle: GoogleFonts.kanit(
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w600,
                      //         color: Color.fromARGB(255, 114, 111, 111),
                      //       ),
                      //       focusedBorder: UnderlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: Color.fromARGB(255, 114, 111, 111),
                      //         ),
                      //       ),
                      //       hintText: "Nama Depan",
                      //       hintStyle: GoogleFonts.kanit(
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w600,
                      //         color: Color.fromARGB(255, 114, 111, 111),
                      //       ),
                      //       fillColor: Colors.white.withOpacity(0.3),
                      //       filled: false,
                      //     ),
                      //   ),
                      // ),
                      // Container(
                      //   padding: EdgeInsets.only(
                      //       left: 15, right: 15, bottom: 5, top: 10),
                      //   child: TextField(
                      //     controller: rc.namaBelakangCtrl,
                      //     cursorColor: Color.fromARGB(255, 176, 205, 176),
                      //     decoration: InputDecoration(
                      //       floatingLabelStyle: GoogleFonts.kanit(
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w600,
                      //         color: Color.fromARGB(255, 114, 111, 111),
                      //       ),
                      //       focusedBorder: UnderlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: Color.fromARGB(255, 114, 111, 111),
                      //         ),
                      //       ),
                      //       hintText: "Nama Belakang",
                      //       hintStyle: GoogleFonts.kanit(
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w600,
                      //         color: Color.fromARGB(255, 114, 111, 111),
                      //       ),
                      //       fillColor: Colors.white.withOpacity(0.3),
                      //       filled: false,
                      //     ),
                      //   ),
                      // ),
                      // Container(
                      //   padding: EdgeInsets.only(
                      //       left: 15, right: 15, bottom: 5, top: 10),
                      //   child: TextField(
                      //     controller: rc.usernameCtrl,
                      //     cursorColor: Color.fromARGB(255, 176, 205, 176),
                      //     decoration: InputDecoration(
                      //       floatingLabelStyle: GoogleFonts.kanit(
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w600,
                      //         color: Color.fromARGB(255, 114, 111, 111),
                      //       ),
                      //       focusedBorder: UnderlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: Color.fromARGB(255, 114, 111, 111),
                      //         ),
                      //       ),
                      //       hintText: "Username",
                      //       hintStyle: GoogleFonts.kanit(
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w600,
                      //         color: Color.fromARGB(255, 114, 111, 111),
                      //       ),
                      //       fillColor: Colors.white.withOpacity(0.3),
                      //       filled: false,
                      //     ),
                      //   ),
                      // ),
                      // Container(
                      //   padding: EdgeInsets.only(
                      //       left: 15, right: 15, bottom: 5, top: 10),
                      //   child: TextField(
                      //     controller: rc.passwordCtrl,
                      //     obscureText: true,
                      //     keyboardType: TextInputType.visiblePassword,
                      //     cursorColor: Color.fromARGB(255, 176, 205, 176),
                      //     decoration: InputDecoration(
                      //       floatingLabelStyle: GoogleFonts.kanit(
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w600,
                      //         color: Color.fromARGB(255, 114, 111, 111),
                      //       ),
                      //       focusedBorder: UnderlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: Color.fromARGB(255, 114, 111, 111),
                      //         ),
                      //       ),
                      //       hintText: "Password",
                      //       hintStyle: GoogleFonts.kanit(
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w600,
                      //         color: Color.fromARGB(255, 114, 111, 111),
                      //       ),
                      //       fillColor: Colors.white.withOpacity(0.3),
                      //       filled: false,
                      //     ),
                      //   ),
                      // ),
                      // Container(
                      //   padding: EdgeInsets.only(
                      //       left: 15, right: 15, bottom: 5, top: 10),
                      //   child: TextField(
                      //     controller: rc.konfirmasiPasswordCtrl,
                      //     obscureText: true,
                      //     keyboardType: TextInputType.visiblePassword,
                      //     cursorColor: Color.fromARGB(255, 176, 205, 176),
                      //     decoration: InputDecoration(
                      //       floatingLabelStyle: GoogleFonts.kanit(
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w600,
                      //         color: Color.fromARGB(255, 114, 111, 111),
                      //       ),
                      //       focusedBorder: UnderlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: Color.fromARGB(255, 114, 111, 111),
                      //         ),
                      //       ),
                      //       hintText: "Konfirmasi Password",
                      //       hintStyle: GoogleFonts.kanit(
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w600,
                      //         color: Color.fromARGB(255, 114, 111, 111),
                      //       ),
                      //       fillColor: Colors.white.withOpacity(0.3),
                      //       filled: false,
                      //     ),
                      //   ),
                      // ),
                      // Container(
                      //   padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                      //   child: TextField(
                      //     controller: rc.nomorTeleponCtrl,
                      //     keyboardType: TextInputType.phone,
                      //     cursorColor: Color.fromARGB(255, 176, 205, 176),
                      //     decoration: InputDecoration(
                      //       floatingLabelStyle: GoogleFonts.kanit(
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w600,
                      //         color: Color.fromARGB(255, 114, 111, 111),
                      //       ),
                      //       focusedBorder: UnderlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: Color.fromARGB(255, 114, 111, 111),
                      //         ),
                      //       ),
                      //       hintText: "Nomer Telepon",
                      //       hintStyle: GoogleFonts.kanit(
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w600,
                      //         color: Color.fromARGB(255, 114, 111, 111),
                      //       ),
                      //       fillColor: Colors.white.withOpacity(0.3),
                      //       filled: false,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    width: 450,
                    child: Text(
                      style: TextStyle(
                        color: Color.fromARGB(255, 100, 99, 99),
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                      "Dengan Mengklik dibawah ini, kamu menyetujui\nseluruh syarat dan ketentuan\nyang berlaku di Aplikasi ini.",
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 300,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 176, 205, 176),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "DAFTAR",
                      style: TextStyle(
                        color: Color.fromARGB(255, 114, 111, 111),
                        // fontFamily: 'Montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: 380,
                    padding: EdgeInsets.only(left: 120),
                    child: Row(
                      children: [
                        Center(
                          child: Text('Punya Akun ?'),
                        ),
                        Center(
                          child: TextButton(
                              child: Text('Login'),
                              onPressed: (() {
                                Navigator.pop(context);
                              })),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);
    pr.style(
      message: 'Menunggu...',
      borderRadius: 10,
      backgroundColor: Colors.white,
      elevation: 10,
      insetAnimCurve: Curves.bounceInOut,
      progress: 0.0,
      maxProgress: 100.0,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19, fontWeight: FontWeight.w900),
    );

    final maxLines = 1;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: hijauTerang,
          ),
          child: ListView(
            children: [
              Container(
                height: 190,
                width: 190,
                margin: EdgeInsets.only(top: 150),
                child: Image(
                  image: AssetImage("assets/logo.png"),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30, left: 50, right: 50),
                child: TextFormField(
                  cursorColor: Color.fromARGB(255, 176, 205, 176),
                  maxLines: maxLines,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    hintText: "Username",
                    prefixIcon: Icon(
                      Icons.people,
                      color: Color.fromARGB(255, 114, 111, 111),
                    ),
                    hintStyle: GoogleFonts.kanit(
                      fontSize: 16,
                      color: Color.fromARGB(255, 114, 111, 111),
                    ),
                    fillColor: Colors.white.withOpacity(0.3),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username anda kosong';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 50, right: 50),
                child: TextFormField(
                  cursorColor: Color.fromARGB(255, 176, 205, 176),
                  maxLines: maxLines,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    hintText: "Password",
                    prefixIcon: Icon(Icons.key,
                        color: Color.fromARGB(255, 114, 111, 111)),
                    hintStyle: GoogleFonts.kanit(
                      fontSize: 16,
                      color: Color.fromARGB(255, 114, 111, 111),
                    ),
                    fillColor: Colors.white.withOpacity(0.3),
                    filled: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password anda Kosong';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 50, right: 50),
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 176, 205, 176),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    // pr.show();
                    // Future.delayed(Duration(seconds: 4)).then((onValue) {
                    //   pr.hide();
                    // });
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const homePage()),
                      );
                    }
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Color.fromARGB(255, 114, 111, 111),
                      // fontFamily: 'Montserrat',
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 70),
                child: Row(
                  children: [
                    Container(
                      child: Text('Register Now ? '),
                    ),
                    Container(
                      child: TextButton(
                        child: Text('Create on account'),
                        onPressed: _showDialog,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      this.controller,
      required this.labelText,
      this.keyboardType = TextInputType.text});

  final TextEditingController? controller;
  final String labelText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
      child: TextField(
        keyboardType: keyboardType,
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
          labelStyle: GoogleFonts.kanit(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 114, 111, 111),
          ),
          fillColor: Colors.white.withOpacity(0.3),
          filled: false,
        ),
      ),
    );
  }
}
