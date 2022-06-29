import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wallpaper_application/component/component.dart';

import 'components/app_bar_person_screen.dart';

class PersonScreen extends StatefulWidget {
  PersonScreen({Key? key}) : super(key: key);

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  final picker = ImagePicker();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //late final File _imageFile;

  /*void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      var _imageFile = File(pickedFile!.path);
    });
  }

  Future deleteImage(BuildContext context) async {
    String fileName = _imageFile.path;
    firebase_storage.Reference firebaseStorageRef =
        firebase_storage.FirebaseStorage.instance.ref().child('$fileName');
    await firebaseStorageRef.delete();
  }

  Future uploadImage(BuildContext context) async {
    String fileName = _imageFile
        .path; // dosya yolunu bir değişkene tanımlıyoruz. - we define the file path of a variable.
    firebase_storage.Reference firebaseStorageRef =
        firebase_storage.FirebaseStorage.instance.ref().child(
            '$fileName'); // fotoğraf için oluşturduğumuz değişkene bir referans tanımlıyoruz.- we define a reference to the variable we have created for the photo.
    firebase_storage.UploadTask uploadTask =
        firebaseStorageRef.putFile(_imageFile);
    firebase_storage.TaskSnapshot taskSnapshot =
        await uploadTask; // fotoğraf yükleme işlemini gerçekleştiriyoruz. - we perform the process of uploading photos.
    taskSnapshot.ref.getDownloadURL().then(
          (value) => print("Completed: $value"),
        ); // dosya yolunu görmek adına debug konsola yazdırıyoruz. - we print the debug to the console to see the file path.
  }*/

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

  /*TextButton deleteImageButton(BuildContext context) {
    return TextButton(
        onPressed: () => deleteImage(context),
        child: const Text(
          "Delete Photo",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ));
  }

  TextButton uploadImageButton(BuildContext context) {
    return TextButton(
      onPressed: () => uploadImage(context),
      child: const Text(
        "Upload Photo",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
    );
  }

  Container photoAddContainer() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 500,
        width: 500,
        child: _imageFile != null
            ? Image.file(_imageFile)
            : TextButton(
                onPressed: pickImage,
                child: const Text(
                  "Photo Add",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                )));
  }*/

  imageUpload() async {
    final ImagePicker _picker = ImagePicker();

    XFile? _file = await _picker.pickImage(source: ImageSource.camera);
    var _profileRef = FirebaseStorage.instance
        .ref('users/' + _firestore.collection("users").doc().id);
    var _task = _profileRef.putFile(File(_file!.path));

    _task.whenComplete(() async {
      var _url = await _profileRef.getDownloadURL();
      _firestore
          .doc('users/' + _firestore.collection("users").doc().id)
          .set({'profile_pic': _url.toString()}, SetOptions(merge: true));
      debugPrint(_url);
    });
  }
}

/*
Scaffold(
      
      body: Column(
        children: [
          /*photoAddContainer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              uploadImageButton(context),
              deleteImageButton(context),
            ],
          ),*/
          Row(
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    imageUpload();
                  },
                  child: Text("Upload Image Firestore"),
                ),
              )
            ],
          )
        ],
      ),
    );

 */

/*
Scaffold(
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

 */
