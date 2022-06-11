import 'package:flutter/material.dart';

import 'splash_screen/splash_screen_one.dart';
void main() {

  runApp(const MyApp());
}
//const SplashScreenOne()
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenOne(),
    );
  }
}
