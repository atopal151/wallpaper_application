import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wallpaper_application/splash_screen/splash_screen_one.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late FirebaseAuth auth;

  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint("Açık Oturum Yok");
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SplashScreenOne()));

        debugPrint("Oturum Email: ${user.email} Durumu: ${user.emailVerified}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
              onPressed: () {
                gmailLogin();
                debugPrint("Sign In");
              },
              child: const Text("Google Sign In"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
              onPressed: () {
                gmailOutUser();
                debugPrint("Sign Out");
              },
              child: const Text("Google Sign Out"),
            ),
          ],
        ),
      ),
    );
  }

  void gmailLogin() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void gmailOutUser() async {
    var _user = GoogleSignIn().currentUser;
    if (_user != null) {
      await GoogleSignIn().currentUser!;
    }
    await auth.signOut();
  }
}
