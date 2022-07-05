import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wallpaper_application/component/firebase_wallpaper_get.dart';
import 'package:wallpaper_application/component/image_card.dart';
import 'package:wallpaper_application/sign_page/sign_in_page.dart';
import '../../component/component.dart';
import 'components/app_bar_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTextWhiteColor,
      appBar: HomeScreenAppBar(context),
      body: const Center(
          child: GetImageDatabase(
        column_count: 2,
        heigth: 500,
        width: 250,
      )),
    );
  }
}
