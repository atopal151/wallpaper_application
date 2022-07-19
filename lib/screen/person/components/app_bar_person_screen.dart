import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../component/component.dart';
import '../../../component/sign_out.dart';

AppBar PersonScreenAppBar(BuildContext context, String name) {
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
              .headline6!
              .copyWith(fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: " $name",
              style: TextStyle(color: kTextColor),
            ),
          ],
        ),
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: Image.asset("assets/icon/closeicon.png"),
        onPressed: () {
          gmailOutUser();
          debugPrint("Sign Out");
        },
      ),
    ],
  );
}
