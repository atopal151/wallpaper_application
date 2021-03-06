import 'package:flutter/material.dart';
import 'package:wallpaper_application/screen/details/details_page.dart';

class ImageCard extends StatefulWidget {
  const ImageCard(
      {Key? key,
      required this.image_path,
      required this.name,
      required this.mail})
      : super(key: key);
  final String image_path;
  final String name;
  final String mail;
  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.image_path,
      child: Container(
        height: 600,
        width: (MediaQuery.of(context).size.width - 40) / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(widget.image_path))),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => DetailsPage(
                        imgPath: widget.image_path,
                        name: widget.name,
                        mail: widget.mail,
                      )),
            );
          },
        ),
      ),
    );
  }
}
