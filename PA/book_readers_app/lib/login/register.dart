import 'package:book_readers_app/Color/color.dart';
import 'package:book_readers_app/controller/Firebase.dart';
import 'package:book_readers_app/controller/TextController.dart';
import 'package:book_readers_app/login/login.dart';
import 'package:book_readers_app/page/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as sliderPopup;
import 'package:google_fonts/google_fonts.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  String? _email, _password;
  final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  FirestoreController fsc = Get.put(FirestoreController());
  RegisterController rc = Get.put(RegisterController());
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
                  margin: EdgeInsets.only(left: 20, right: 20),
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
                      // MyTextField(
                      //   controller: rc.namaDepanController,
                      //   labelText: "Nama Depan",
                      // ),
                      // MyTextField(
                      //   controller: rc.namaBelakangController,
                      //   labelText: "Nama Belakang",
                      // ),
                      // MyTextField(
                      //   controller: rc.usernameController,
                      //   labelText: "Username",
                      // ),
                      // MyTextField(
                      //   controller: rc.passwordController,
                      //   labelText: "Password",
                      // ),
                      // MyTextField(
                      //   controller: rc.confirmPasswordController,
                      //   labelText: "Konfirmasi Password",
                      // ),
                      // MyTextField(
                      //   controller: rc.noHpController,
                      //   labelText: "Nomor HP",
                      //   keyboardType: TextInputType.number,
                      // ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 15, right: 15, bottom: 5, top: 10),
                        child: TextField(
                          controller: rc.namaDepanCtrl,
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
                            hintText: "Nama Depan",
                            hintStyle: GoogleFonts.kanit(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 114, 111, 111),
                            ),
                            fillColor: Colors.white.withOpacity(0.3),
                            filled: false,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 15, right: 15, bottom: 5, top: 10),
                        child: TextField(
                          controller: rc.namaBelakangCtrl,
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
                            hintText: "Nama Belakang",
                            hintStyle: GoogleFonts.kanit(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 114, 111, 111),
                            ),
                            fillColor: Colors.white.withOpacity(0.3),
                            filled: false,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 15, right: 15, bottom: 5, top: 10),
                        child: TextField(
                          controller: rc.emailCtrl,
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
                            hintText: "Email",
                            hintStyle: GoogleFonts.kanit(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 114, 111, 111),
                            ),
                            fillColor: Colors.white.withOpacity(0.3),
                            filled: false,
                          ),
                          onChanged: (value) {
                            setState(() {
                              _email = value.trim();
                            });
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 15, right: 15, bottom: 5, top: 10),
                        child: TextField(
                          controller: rc.passwordCtrl,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
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
                            hintText: "Password",
                            hintStyle: GoogleFonts.kanit(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 114, 111, 111),
                            ),
                            fillColor: Colors.white.withOpacity(0.3),
                            filled: false,
                          ),
                          onChanged: (value) {
                            setState(() {
                              _password = value.trim();
                            });
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 15, right: 15, bottom: 5, top: 10),
                        child: TextField(
                          controller: rc.konfirmasiPasswordCtrl,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
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
                            hintText: "Konfirmasi Password",
                            hintStyle: GoogleFonts.kanit(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 114, 111, 111),
                            ),
                            fillColor: Colors.white.withOpacity(0.3),
                            filled: false,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                        child: TextField(
                          controller: rc.nomorTeleponCtrl,
                          keyboardType: TextInputType.phone,
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
                            hintText: "Nomer Telepon",
                            hintStyle: GoogleFonts.kanit(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 114, 111, 111),
                            ),
                            fillColor: Colors.white.withOpacity(0.3),
                            filled: false,
                          ),
                        ),
                      ),
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
                      auth
                          .createUserWithEmailAndPassword(
                              email: rc.emailCtrl.text,
                              password: rc.passwordCtrl.text)
                          .then((_) {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => login()));
                      });
                      fsc.register.value.add({
                        'nama depan': rc.namaDepanCtrl.text,
                        'nama belakang': rc.namaBelakangCtrl.text,
                        'email': rc.emailCtrl.text,
                        'password': rc.passwordCtrl.text,
                        'konfirmasi password': rc.konfirmasiPasswordCtrl.text,
                        'nomor telepon': rc.nomorTeleponCtrl.text,
                      });
                      final snackBar = SnackBar(
                        content: Text('Registrasi Anda Berhasil !'),
                        action: SnackBarAction(
                          label: 'OKE',
                          onPressed: () {},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      rc.namaDepanCtrl.clear();
                      rc.namaBelakangCtrl.clear();
                      rc.emailCtrl.clear();
                      rc.passwordCtrl.clear();
                      rc.konfirmasiPasswordCtrl.clear();
                      rc.nomorTeleponCtrl.clear();
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
    return Scaffold(
      body: login(),
    );
  }
}
