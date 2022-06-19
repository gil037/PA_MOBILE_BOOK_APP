import 'package:book_readers_app/Color/color.dart';
import 'package:book_readers_app/controller/Firebase.dart';
import 'package:book_readers_app/controller/TextController.dart';
import 'package:book_readers_app/page/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as sliderPopup;
import 'package:google_fonts/google_fonts.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
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
                  controller: rc.emailCtrl,
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
                    hintText: "Email",
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
                  validator: (value) =>
                      value!.isEmpty ? 'Email tidak boleh kosong' : null,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 50, right: 50),
                child: TextFormField(
                  controller: rc.passwordCtrl,
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
                  validator: (value) =>
                      value!.isEmpty ? 'Password tidak boleh kosong' : null,
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
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => login()),
                      );
                    }
                    auth
                        .signInWithEmailAndPassword(
                            email: rc.emailCtrl.text,
                            password: rc.passwordCtrl.text)
                        .then((_) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => homePage()));
                    });
                    rc.emailCtrl.clear();
                    rc.passwordCtrl.clear();
                    final snackBar = SnackBar(
                      content: Text('Login Anda Berhasil !'),
                      action: SnackBarAction(
                        label: 'OKE',
                        onPressed: () {},
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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

Future<FirebaseApp> _initializeFirebase() async {
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  return firebaseApp;
}

// class MyTextField extends StatelessWidget {
//   const MyTextField(
//       {super.key,
//       this.controller,
//       required this.labelText,
//       this.keyboardType = TextInputType.text});

//   final TextEditingController? controller;
//   final String labelText;
//   final TextInputType? keyboardType;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 15, right: 15, top: 10),
//       child: TextField(
//         keyboardType: keyboardType,
//         cursorColor: Color.fromARGB(255, 176, 205, 176),
//         decoration: InputDecoration(
//           floatingLabelStyle: GoogleFonts.kanit(
//             fontSize: 14,
//             fontWeight: FontWeight.w600,
//             color: Color.fromARGB(255, 114, 111, 111),
//           ),
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(
//               color: Color.fromARGB(255, 114, 111, 111),
//             ),
//           ),
//           labelText: labelText,
//           labelStyle: GoogleFonts.kanit(
//             fontSize: 14,
//             fontWeight: FontWeight.w600,
//             color: Color.fromARGB(255, 114, 111, 111),
//           ),
//           fillColor: Colors.white.withOpacity(0.3),
//           filled: false,
//         ),
//       ),
//     );
//   }
// }
