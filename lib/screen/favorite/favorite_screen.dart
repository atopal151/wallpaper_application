import 'package:flutter/material.dart';

import '../../component/component.dart';
import 'components/app_bar_favorite_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTextWhiteColor,
      appBar: FavortieScreenAppBar(context),
      body: Center(
        child: Text("Favorite Screen"),
      ),
    );
  }
}
