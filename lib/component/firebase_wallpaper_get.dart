import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wallpaper_application/component/component.dart';
import 'package:wallpaper_application/screen/home/components/app_bar_home_screen.dart';

import '../screen/details/details_page.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 55) / 2;
    final double itemWidth = size.width / 2;

    CollectionReference users =
        FirebaseFirestore.instance.collection('wallpapers');
    final Stream<QuerySnapshot> _usersStream =
        FirebaseFirestore.instance.collection('wallpapers').snapshots();

    return Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SpinKitRing(
                color: kPrimaryColor,
                size: 50.0,
              );
            }
            return GridView.count(
              crossAxisCount: widget.column_count,
              childAspectRatio: (itemWidth / itemHeight),
              scrollDirection: Axis.vertical,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  semanticContainer: true,
                  elevation: 2,
                  margin: EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: GridTile(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                      imgPath: data['wallpaper_pic'].toString(),
                                    )));
                      },
                      child: Container(
                        height: widget.heigth,
                        width: widget.width,
                        child: Image.network(
                          data['wallpaper_pic'].toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ));
  }
}



/*

firestore get image

  Future<void> getImage() async {
    final result = await firebase_storage.FirebaseStorage.instance
        .ref()
        .child(widget.file_path)
        .listAll();
    imgList.clear();
    result.items.forEach((firebase_storage.Reference ref) {
      imgList
          .add("gs://wallpaperapplication-c0ae6.appspot.com/${ref.fullPath}");
      debugPrint(ref.root.toString());
    });
  }


 */