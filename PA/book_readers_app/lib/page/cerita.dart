import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

String? filename;
File? image;
// FirebaseStorage storage = FirebaseStorage.instance;

class Tulis extends StatefulWidget {
  const Tulis({super.key});

  @override
  State<Tulis> createState() => _TulisState();
}

class _TulisState extends State<Tulis> {
  final ImagePicker _picker = ImagePicker();

  Future<File?> takePhoto(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    final File file = File(image!.path);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            image == null ? const Text('select image') : UploadArea(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          takePhoto(ImageSource.camera).then((File? file) {
            setState(() {
              image = file;
            });
          });
        },
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget UploadArea() {
  return Column(
    children: <Widget>[
      Image.file(
        image!,
        width: double.infinity,
      ),
      ElevatedButton(
        child: const Text('Upload'),
        onPressed: () {
          uploadImage();
        },
      )
    ],
  );
}

Future<String> uploadImage() async {
  TaskSnapshot taskSnapshot = await FirebaseStorage.instance
      .ref()
      .child("profile")
      .child(FirebaseAuth.instance.currentUser?.uid ?? 'no user')
      .putFile(image!);

  return taskSnapshot.ref.getDownloadURL();
}
