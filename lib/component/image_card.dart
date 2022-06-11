import 'package:flutter/material.dart';
import 'package:wallpaper_application/screen/details/details_page.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({Key? key, required this.image_path}) : super(key: key);

  final String image_path;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint("Resme Basıldı");
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => DetailsPage(imgPath: image_path)),
        );
      },
      child: Hero(
        tag: "tag",
        child: Container(
            height: 300,
            width: (MediaQuery.of(context).size.width - 40) / 2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(image_path)))),
      ),
    );
  }
}
