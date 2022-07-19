import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wallpaper_application/component/component.dart';
import 'package:wallpaper_application/screen/person/components/app_bar_person_screen.dart';
import '../../component/firebase_wallpaper_get.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  final picker = ImagePicker();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late FirebaseAuth auth;
  late String mailaddress;
  // ignore: non_constant_identifier_names
  late String photo_url;
  late String name;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth = FirebaseAuth.instance;
    mailaddress = auth.currentUser!.email!;
    photo_url = auth.currentUser!.photoURL!;
    name = auth.currentUser!.displayName!;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(_firestore.collection("wallpapers").id);
    debugPrint(_firestore.collection("wallpapers").doc().id);
    return Scaffold(
      appBar: PersonScreenAppBar(context, name),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60,
                  backgroundImage: NetworkImage(photo_url),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 17),
                )),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  mailaddress,
                  style: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w400),
                )),
              ],
            ),
          ),
          const Expanded(
            flex: 2,
            child: Center(
              child: GetImageDatabase(
                column_count: 3,
                heigth: 250,
                width: 250,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          imageUpload();
          setState(() {});
        },
        child: const Icon(
          Icons.photo,
          color: kPrimaryColor,
        ),
      ),
    );
  }

  imageUpload() async {
    final ImagePicker _picker = ImagePicker();

    XFile? _file = await _picker.pickImage(source: ImageSource.gallery);
    var _profileRef = FirebaseStorage.instance
        .ref('wallpapers/' + _firestore.collection("wallpapers").doc().id);
    var _task = _profileRef.putFile(File(_file!.path));

    _task.whenComplete(() async {
      var _url = await _profileRef.getDownloadURL();
      _firestore
          .doc('wallpapers/' + _firestore.collection("wallpapers").doc().id)
          .set({
        'wallpaper_pic': _url.toString(),
        'shareuid': auth.currentUser!.email.toString()
      }, SetOptions(merge: true));

      debugPrint(_url);
    });
  }
}
