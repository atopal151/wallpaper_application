import 'package:flutter/material.dart';
import '../../../component/component.dart';



AppBar FavortieScreenAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,

    title: Container(
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(
            color: kPrimaryTwoColor,
            width: 3.0,
          ),

        ),
      ),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontWeight: FontWeight.bold),
          children: const [
            TextSpan(
              text: " Favorites",
              style: TextStyle(color: kTextColor),
            ),

          ],
        ),
      ),
    ),

  );
}
