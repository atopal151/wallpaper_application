import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:wallpaper_manager/wallpaper_manager.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, required this.imgPath}) : super(key: key);
  final String imgPath;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
/*  String? _platformVersion = 'Unknown';
  String? _wallpaperFile = 'Unknown';
  String? _wallpaperFileWithCrop = 'Unknown';
  String? _wallpaperAsset = 'Unknown';
  String? _wallpaperAssetWithCrop = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await WallpaperManager.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<void> setWallpaperFromAsset() async {
    setState(() {
      _wallpaperAsset = "Loading";
    });
    String result;
    String assetPath = "assets/tmp1.jpg";
    try {
      result = await WallpaperManager.setWallpaperFromAsset(
          assetPath, WallpaperManager.HOME_SCREEN);
    } on PlatformException {
      result = 'Failed to get wallpaper.';
    }

    if (!mounted) return;

    setState(() {
      _wallpaperAsset = result;
    });
  }

  Future<void> setWallpaperFromAssetWithCrop() async {
    setState(() {
      _wallpaperAssetWithCrop = "Loading";
    });
    String result;
    String assetPath = "assets/tmp1.jpg";
    try {
      result = await WallpaperManager.setWallpaperFromAssetWithCrop(
          assetPath, WallpaperManager.HOME_SCREEN, 0, 0, 800, 800);
    } on PlatformException {
      result = 'Failed to get wallpaper.';
    }

    if (!mounted) return;

    setState(() {
      _wallpaperAssetWithCrop = result;
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: widget.imgPath,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(widget.imgPath),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: const <Widget>[
                  /*  RaisedButton(
                    child: Text("Platform Version"),
                    onPressed: initPlatformState,
                  ),
                  Center(
                    child: Text('Running on: $_platformVersion\n'),
                  ),
                  RaisedButton(
                    child: Text("Set wallpaper from asset"),
                    onPressed: setWallpaperFromAsset,
                  ),
                  Center(
                    child: Text('Wallpaper status: $_wallpaperAsset\n'),
                  ),
                  RaisedButton(
                    child: Text("Set wallpaper from asset with crop"),
                    onPressed: setWallpaperFromAssetWithCrop,
                  ),
                  Center(
                    child: Text('Wallpaper status: $_wallpaperAssetWithCrop\n'),
                  ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
