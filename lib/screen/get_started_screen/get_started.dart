import 'package:flutter/material.dart';
import 'package:wallpaper_application/splash_screen/splash_screen_one.dart';

import '../../sign_page/sign_in_page.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: ElevatedButton(
            child: const Text("Get Started"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SplashScreenOne()));
            },
          ),
        ),
      ),
    );
  }
}
