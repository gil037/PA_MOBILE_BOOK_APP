import 'package:book_readers_app/Color/color.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as sliderPopup;

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  late ProgressDialog pr;

  void _showDialog() {
    sliderPopup.showSlideDialog(
      context: context,
      barrierColor: Colors.transparent,
      pillColor: Colors.white,
      backgroundColor: hijauTua,
      child: Expanded(
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: hijauTerang,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: hijauTerang,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: hijauTerang,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextButton(
                    onPressed: () {
                      pr.show();
                      Future.delayed(Duration(seconds: 3)).then((value) {
                        pr.hide().whenComplete(() {
                          Navigator.pushReplacementNamed(context, '/home');
                        });
                      });
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: hijauTua,
                      ),
                    ),
                  ),
                ),
              ],
              // crossAxisAlignment: CrossAxisAlignment.center,
              // children: <Widget>[
              //   Container(
              //     height: MediaQuery.of(context).size.height / 2,
              //     width: 380,
              //     child: TextField(
              //       cursorColor: Color.fromARGB(255, 176, 205, 176),
              //       maxLines: 1,
              //       decoration: InputDecoration(
              //         enabledBorder: OutlineInputBorder(
              //             borderSide: BorderSide(color: Colors.transparent)),
              //         focusedBorder: OutlineInputBorder(
              //           borderSide: BorderSide(color: Colors.transparent),
              //         ),
              //         hintText: "Enter a Username",
              //         prefixIcon: Icon(
              //           Icons.people,
              //           color: Color.fromARGB(255, 114, 111, 111),
              //         ),
              //         hintStyle: TextStyle(
              //           color: Colors.black.withOpacity(0.5),
              //           fontSize: null,
              //           fontWeight: FontWeight.w400,
              //           fontStyle: FontStyle.normal,
              //         ),
              //         fillColor: Colors.white.withOpacity(0.3),
              //         filled: true,
              //       ),
              //     ),
              //   ),
              // ],
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
            color: Colors.black, fontSize: 19, fontWeight: FontWeight.w900));

    final maxLines = 1;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 211, 89),
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
              child: TextField(
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
                  hintText: "Enter a Username",
                  prefixIcon: Icon(
                    Icons.people,
                    color: Color.fromARGB(255, 114, 111, 111),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: null,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                  fillColor: Colors.white.withOpacity(0.3),
                  filled: true,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 50, right: 50),
              child: TextField(
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
                  hintText: "Enter a Password",
                  prefixIcon: Icon(Icons.key,
                      color: Color.fromARGB(255, 114, 111, 111)),
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: null,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                  fillColor: Colors.white.withOpacity(0.3),
                  filled: true,
                ),
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
                  pr.show();
                  Future.delayed(Duration(seconds: 4)).then((onValue) {
                    pr.hide();
                  });
                },
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    color: Color.fromARGB(255, 114, 111, 111),
                    // fontFamily: 'Montserrat',
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 90),
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
    );
  }
}
