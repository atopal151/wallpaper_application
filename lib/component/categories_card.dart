import 'package:flutter/material.dart';

import '../screen/category_card_detail/category_card_details.dart';

class CategoriesCard extends StatefulWidget {
  const CategoriesCard({Key? key, required this.image_path}) : super(key: key);
  final String image_path;
  @override
  State<CategoriesCard> createState() => _CategoriesCardState();
}

class _CategoriesCardState extends State<CategoriesCard> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.image_path,
      child: Container(
        height: 150,
        width: (MediaQuery.of(context).size.width - 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(widget.image_path))),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => CategoriesCardDetails(
                        imgPath: widget.image_path,
                      )),
            );
          },
        ),
      ),
    );
  }
}
