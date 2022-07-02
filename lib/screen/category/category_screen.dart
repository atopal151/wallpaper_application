import 'package:flutter/material.dart';
import 'package:wallpaper_application/component/categories_card.dart';

import '../../component/component.dart';
import 'components/app_bar_category_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTextWhiteColor,
      appBar: CategoryScreenAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: const [
              /* CategoriesCard(
                image_path: "assets/images/img1.jpg",
              ),
              SizedBox(
                height: 20,
              ),
              CategoriesCard(
                image_path: "assets/images/img.jpg",
              ),
              SizedBox(
                height: 20,
              ),
              CategoriesCard(
                image_path: "assets/images/img2.jpg",
              ),
              SizedBox(
                height: 20,
              ),
              CategoriesCard(
                image_path: "assets/images/img3.jpg",
              ),
              SizedBox(
                height: 20,
              ),
              CategoriesCard(
                image_path: "assets/images/img4.jpg",
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
