import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wallpaper_application/screen/home/components/app_bar_home_screen.dart';

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

  List<String> imgList = [];

  Future<void> getImage() async {
    final result = await firebase_storage.FirebaseStorage.instance
        .ref()
        .child(widget.file_path)
        .listAll();
    result.items.forEach((firebase_storage.Reference ref) {
      imgList
          .add("gs://wallpaperapplication-c0ae6.appspot.com/${ref.fullPath}");

      setState(() {});
    });
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
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
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
              print("işlem burada ");
              return Container(
                height: widget.heigth,
                width: widget.width,
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder<dynamic>(
                  future: firebase_storage.FirebaseStorage.instance
                      .refFromURL(imgList[index])
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
      ),
    );
  }
}

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
  late String docid = "users/";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<String> imgList = [];
  getDataImage() async {
    var dataImage = await _firestore.collection('users').get();
    debugPrint(dataImage.size.toString());
    debugPrint(dataImage.docs.length.toString());

    for (var image in dataImage.docs) {
      imgList.add(image.data().toString());
      debugPrint(imgList.toString());
    }
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
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: ElevatedButton(
          child: Text("getımge"),
          onPressed: () {
            getDataImage();
          },
        )));
    /*Container(
        child: GridView.count(
          crossAxisCount: widget.column_count,
          childAspectRatio: (itemWidth / itemHeight),
          scrollDirection: Axis.vertical,
          children: List.generate(
            imageMap.length,
            ((index) {
              print("işlem burada ");
              return Container(
                height: widget.heigth,
                width: widget.width,
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder<dynamic>(
                  future: firebase_storage.FirebaseStorage.instance
                      .refFromURL(imageMap[index])
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
      ),
    );*/
  }
}
