import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

late FirebaseAuth auth;

void gmailOutUser() async {
  var _user = GoogleSignIn().currentUser;
  if (_user != null) {
    await GoogleSignIn().currentUser!;
  }
  await auth.signOut();
}
