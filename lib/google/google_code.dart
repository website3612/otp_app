import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn googleSignIn = GoogleSignIn();

Future signInWithGoogle() async {
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication? googleSignInAuthentication =
      await googleSignInAccount!.authentication;
  AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication!.accessToken,
      idToken: googleSignInAuthentication.idToken);

  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
  User? user = userCredential.user;
}
