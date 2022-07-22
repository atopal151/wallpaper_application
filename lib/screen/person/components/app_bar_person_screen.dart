import 'package:flutter/material.dart';
import '../../../component/component.dart';
import '../../../component/sign_out.dart';

AppBar PersonScreenAppBar(BuildContext context, String mail) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    automaticallyImplyLeading: false,
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
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: " $mail",
              style: const TextStyle(color: kTextColor),
            ),
          ],
        ),
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: Image.asset(
          "assets/icon/closeicon.png",
        ),
        onPressed: () {
          gmailOutUser();
          debugPrint("Sign Out");
        },
      ),
    ],
  );
}
