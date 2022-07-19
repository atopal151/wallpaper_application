import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wallpaper_application/component/component.dart';
import 'package:wallpaper_application/screen/home/components/app_bar_home_screen.dart';

import '../screen/details/details_page.dart';

List<String> imgList = [];

class FirebaseGetImage extends StatefulWidget {
  const FirebaseGetImage(
      {Key? key,
      required this.file_path,
      required this.column_count,
      required this.width,
      required this.heigth})
      : super(key: key);
  final String file_path;
  final int column_count;
  final double width;
  final double heigth;
  @override
  _FirebaseGetImageState createState() => _FirebaseGetImageState();
}

class _FirebaseGetImageState extends State<FirebaseGetImage> {
  late firebase_storage.ListResult result;

  Future<void> getImage() async {
    final result = await firebase_storage.FirebaseStorage.instance
        .ref()
        .child(widget.file_path)
        .listAll();
    imgList.clear();
    result.items.forEach((firebase_storage.Reference ref) {
      imgList
          .add("gs://wallpaperapplication-c0ae6.appspot.com/${ref.fullPath}");
      debugPrint(imgList.toString());
    });
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 120) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: GridView.count(
          crossAxisCount: widget.column_count,
          childAspectRatio: (itemWidth / itemHeight),
          scrollDirection: Axis.vertical,
          children: List.generate(
            imgList.length,
            ((index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(
                                imgPath:
                                    "https://firebasestorage.googleapis.com/v0/b/wallpaperapplication-c0ae6.appspot.com/o/users%2FZkg0p1hPYizc5xDpRigi?alt=media&token=cb83518f-2679-448f-8ffa-8c39fdb4883f",
                              )));
                },
                child: Container(
                  height: widget.heigth,
                  width: widget.width,
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder<dynamic>(
                    future: firebase_storage.FirebaseStorage.instance
                        .refFromURL(imgList[index])
                        .getDownloadURL(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.connectionState != ConnectionState.waiting) {
                        return Image(
                          image: CachedNetworkImageProvider(
                              snapshot.data.toString()),
                          fit: BoxFit.cover,
                        );
                      } else {
                        return const SpinKitRing(
                          color: Colors.blueGrey,
                          size: 50.0,
                        );
                      }
                    },
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

List<String> imggetList = [];

class GetImageDatabase extends StatefulWidget {
  const GetImageDatabase(
      {Key? key,
      required this.column_count,
      required this.width,
      required this.heigth})
      : super(key: key);
  final int column_count;
  final double width;
  final double heigth;
  @override
  State<GetImageDatabase> createState() => _GetImageDatabaseState();
}

class _GetImageDatabaseState extends State<GetImageDatabase> {
  late DocumentSnapshot snapshot;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  getDataImage() async {
    var _userRef = _firestore.collection('users');
    var _stringSearch = await _userRef.orderBy('profile_pic').get();
    imggetList.clear();
    for (var user in _stringSearch.docs) {
      imggetList.add(user.data().toString());
      debugPrint(imggetList.toString());
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataImage();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: GridView.count(
          crossAxisCount: widget.column_count,
          childAspectRatio: (itemWidth / itemHeight),
          scrollDirection: Axis.vertical,
          children: List.generate(
            imggetList.length,
            ((index) {
              return InkWell(
                onTap: () {},
                child: Container(
                  height: widget.heigth,
                  width: widget.width,
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: kPrimaryColor,
                    child: Text(
                      imggetList.sublist(index, index + 1).toString(),
                    ), /*FutureBuilder<dynamic>(
                    future: firebase_storage.FirebaseStorage.instance
                        .refFromURL(imggetList[index])
                        .getDownloadURL(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.connectionState != ConnectionState.waiting) {
                        return Image(
                          image: CachedNetworkImageProvider(
                              snapshot.data.toString()),
                          fit: BoxFit.cover,
                        );
                      } else {
                        return const SpinKitRing(
                          color: Colors.blueGrey,
                          size: 50.0,
                        );
                      }
                    },
                  ),*/
                  ),
                ),
              );
            }),
          ),
        ),
      ), /*Container(
        child: GridView.count(
          crossAxisCount: widget.column_count,
          childAspectRatio: (itemWidth / itemHeight),
          scrollDirection: Axis.vertical,
          children: List.generate(
            imgList.length,
            ((index) {
              print("işlem burada ");
              return Container(
                height: widget.heigth,
                width: widget.width,
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder<dynamic>(
                  future: firebase_storage.FirebaseStorage.instance
                      .refFromURL("https")
                      .getDownloadURL(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState != ConnectionState.waiting) {
                      return Image(
                        image: CachedNetworkImageProvider(
                            snapshot.data.toString()),
                        fit: BoxFit.cover,
                      );
                    } else {
                      return const SpinKitRing(
                        color: Colors.blueGrey,
                        size: 50.0,
                      );
                    }
                  },
                ),
              );
            }),
          ),
        ),
      ),*/
    );
  }
}
