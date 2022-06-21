import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wallpaper_application/component/image_card.dart';
import 'package:wallpaper_application/sign_page/sign_in_page.dart';
import '../../component/component.dart';
import 'components/app_bar_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late FirebaseAuth auth;

  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTextWhiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                  text: " WallBack",
                  style: TextStyle(color: kTextColor),
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          Column(
            children: [
              IconButton(
                icon: Image.asset("assets/icon/logout.png"),
                onPressed: () {
                  gmailOutUser();
                  debugPrint("Sign Out");
                },
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  ImageCard(
                    tag: "tag5",
                    image_path: 'assets/images/image.jpg',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ImageCard(
                    tag: "tag6",
                    image_path: 'assets/images/image.jpg',
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  ImageCard(
                    image_path: 'assets/images/image.jpg',
                    tag: "tag1",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ImageCard(
                    tag: "tag2",
                    image_path: 'assets/images/image.jpg',
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  ImageCard(
                    tag: "tag3",
                    image_path: 'assets/images/image.jpg',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ImageCard(
                    tag: "tag4",
                    image_path: 'assets/images/image.jpg',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void gmailOutUser() async {
    var _user = GoogleSignIn().currentUser;
    if (_user != null) {
      await GoogleSignIn().currentUser!;
    }
    await auth.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignInPage()));
    //direkt olarak uygulamayı kapatıyor.
    //SystemNavigator.pop();
  }
}
