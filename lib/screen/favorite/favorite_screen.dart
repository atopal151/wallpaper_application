import 'package:flutter/material.dart';
import '../../component/component.dart';
import 'components/app_bar_favorite_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTextWhiteColor,
      appBar: FavortieScreenAppBar(context),
      body: const Center(),
    );
  }
}
