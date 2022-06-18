import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirestoreController extends GetxController {
  var register = FirebaseFirestore.instance.collection('register').obs;
  var books = FirebaseFirestore.instance.collection("books").obs;
  var dukungan = FirebaseFirestore.instance.collection("dukungan").obs;
}

Future<bool> checkUser(String email) async {
  var user = await FirebaseFirestore.instance
      .collection('register')
      .where('email', isEqualTo: email)
      .get();
  if (user.docs.isEmpty) {
    return true;
  } else {
    return false;
  }
}
