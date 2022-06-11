import 'package:flutter/material.dart';
import 'package:wallpaper_application/component/image_card.dart';
import '../../component/component.dart';
import 'components/app_bar_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTextWhiteColor,
      appBar: HomeScreenAppBar(context),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  ImageCard(image_path: 'assets/images/image.jpg',),
                  SizedBox(
                    width: 10,
                  ),
                  ImageCard(image_path: 'assets/images/image.jpg',),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  ImageCard(image_path: 'assets/images/image.jpg',),
                  SizedBox(
                    width: 10,
                  ),
                  ImageCard(image_path: 'assets/images/image.jpg',),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  ImageCard(image_path: 'assets/images/image.jpg',),
                  SizedBox(
                    width: 10,
                  ),
                  ImageCard(image_path: 'assets/images/image.jpg',),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
