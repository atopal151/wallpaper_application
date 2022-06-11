import 'package:flutter/material.dart';

import '../../component/component.dart';
import 'components/app_bar_category_screen.dart';


class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTextWhiteColor,
      appBar: CategoryScreenAppBar(context),
      body: Center(
        child: Text("Category Screen"),
      ),
    );
  }
}
