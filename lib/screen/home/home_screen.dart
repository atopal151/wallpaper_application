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

  List<String> imgList = [
    "assets/images/img.jpg",
    "assets/images/img1.jpg",
    "assets/images/img2.jpg",
    "assets/images/img3.jpg",
    "assets/images/img4.jpg",
    "assets/images/img5.jpg",
    "assets/images/img6.jpg",
    "assets/images/img7.jpg",
    "assets/images/img8.jpg",
    "assets/images/img5.jpg",
  ];

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
                icon: Image.asset("assets/icon/wallpy.png"),
                onPressed: () {
                  gmailOutUser();
                  debugPrint("Sign Out");
                },
              ),
            ],
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        children: List.generate(
          imgList.length,
          ((index) {
            return Center(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: ImageCard(
                  image_path: imgList[index],
                ),
              ),
            );
          }),
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






/*


InkWell(
                            //bu bizim conteinirimizi tıklanabilir hale getirecektir...
                            onTap: () {
                              debugPrint("Resme Basıldı");
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Detay(
                                        imgPath: "assets/modelgrid1.jpeg")),
                              );
                            },
                            child: Hero(
                              tag: "assets/modelgrid1.jpeg",
                              child: Container(
                                  height: 200,
                                  width: (MediaQuery.of(context).size.width -
                                          100) /
                                      2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/modelgrid1.jpeg")))),
                            ),
                          ),*/