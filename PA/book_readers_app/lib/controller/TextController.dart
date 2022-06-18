import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var namaDepan = ''.obs;
  var namaBelakang = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var konfirmasiPassword = ''.obs;
  var nomorTelepon = ''.obs;

  final namaDepanCtrl = TextEditingController();
  final namaBelakangCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final konfirmasiPasswordCtrl = TextEditingController();
  final nomorTeleponCtrl = TextEditingController();

  onPressed() {
    namaDepan = namaDepanCtrl.text.obs;
    namaBelakang = namaBelakangCtrl.text.obs;
    email = emailCtrl.text.obs;
    password = passwordCtrl.text.obs;
    konfirmasiPassword = konfirmasiPasswordCtrl.text.obs;
    nomorTelepon = nomorTeleponCtrl.text.obs;
  }
}

class searchController extends GetxController {
  TextEditingController CariCTRL = TextEditingController();
}

class tulisController extends GetxController {
  // ignore: non_constant_identifier_names
  TextEditingController JudulCtrl = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController DeskripsiCtrl = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController IsiCtrl = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController AuthorCtrl = TextEditingController();
}

class DukunganController extends GetxController {
  // ignore: non_constant_identifier_names
  TextEditingController KomentarCtrl = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController SaranCtrl = TextEditingController();
}
