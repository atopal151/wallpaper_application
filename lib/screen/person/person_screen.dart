import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wallpaper_application/component/component.dart';

import 'components/app_bar_person_screen.dart';

class PersonScreen extends StatelessWidget {
  PersonScreen({Key? key}) : super(key: key);

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    debugPrint(_firestore.collection("users").id);
    debugPrint(_firestore.collection("users").doc().id);
    return Scaffold(
      appBar: PersonScreenAppBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => imageUpload(),
              style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
              child: const Text("Kamera Galeri Image Upload"),
            ),
          ],
        ),
      ),
    );
  }

  imageUpload() async {
    final ImagePicker _picker = ImagePicker();

    XFile? _file = await _picker.pickImage(source: ImageSource.camera);
    var _profileRef =
        FirebaseStorage.instance.ref('users/JBb5dLNX2aWzUZ438c1j');
    var _task = _profileRef.putFile(File(_file!.path));

    _task.whenComplete(() async {
      var _url = await _profileRef.getDownloadURL();
      _firestore
          .doc("users/JBb5dLNX2aWzUZ438c1j")
          .set({'profile_pic': _url.toString()}, SetOptions(merge: true));
      debugPrint(_url);
    });
  }
}
