import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var namaDepan = ''.obs;
  var namaBelakang = ''.obs;
  var username = ''.obs;
  var password = ''.obs;
  var konfirmasiPassword = ''.obs;
  var nomorTelepon = ''.obs;

  final namaDepanCtrl = TextEditingController();
  final namaBelakangCtrl = TextEditingController();
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final konfirmasiPasswordCtrl = TextEditingController();
  final nomorTeleponCtrl = TextEditingController();

  onPressed() {
    namaDepan = namaDepanCtrl.text.obs;
    namaBelakang = namaBelakangCtrl.text.obs;
    username = usernameCtrl.text.obs;
    password = passwordCtrl.text.obs;
    konfirmasiPassword = konfirmasiPasswordCtrl.text.obs;
    nomorTelepon = nomorTeleponCtrl.text.obs;
  }

  @override
  void onClose() {
    namaDepanCtrl.dispose();
    namaBelakangCtrl.dispose();
    usernameCtrl.dispose();
    passwordCtrl.dispose();
    konfirmasiPasswordCtrl.dispose();
    nomorTeleponCtrl.dispose();
    print("Text Controller sudah terhapus");
    super.onClose();
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
