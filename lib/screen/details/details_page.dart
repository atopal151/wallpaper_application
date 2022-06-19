import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.imgPath, required this.tag}) : super(key: key);
  final String imgPath;
  final String tag;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Hero(
        tag: tag,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imgPath),
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }
}
