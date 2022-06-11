import 'package:flutter/material.dart';
import 'package:wallpaper_application/component/component.dart';

import 'components/app_bar_person_screen.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTextWhiteColor,
      appBar: PersonScreenAppBar(context),
      body: Center(
        child: Text("Person Screen"),
      ),
    );
  }
}
