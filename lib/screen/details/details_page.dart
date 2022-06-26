import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, required this.imgPath}) : super(key: key);
  final String imgPath;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
                children: const <Widget>[],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
