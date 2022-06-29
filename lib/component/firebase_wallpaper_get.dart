import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class FirebaseGetImage extends StatefulWidget {
  @override
  _FirebaseGetImageState createState() => _FirebaseGetImageState();
}

class _FirebaseGetImageState extends State<FirebaseGetImage> {
  late firebase_storage.ListResult result;

  List<String> imgList = [];

  Future<void> getImage() async {
    final result = await firebase_storage.FirebaseStorage.instance
        .ref()
        .child("wallpaper")
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
      body: Container(
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (itemWidth / itemHeight),
          scrollDirection: Axis.vertical,
          children: List.generate(
            imgList.length,
            ((index) {
              print("işlem burada ");
              return Container(
                height: 500,
                width: 250,
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
