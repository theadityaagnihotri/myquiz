import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CurrentUser extends ChangeNotifier {
  String _uid = "";
  String _email = "";

  String get getuid => _uid;
  String get getEmail => _email;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signupUser(String email, String password) async {
    String retVal = "error";

    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      retVal = "success";
    } catch (e) {
      retVal = e.toString();
    }

    return retVal;
  }

  Future<String> loginUserWithEmail(String email, String password) async {
    String retVal = "error";

    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (_authResult.user != null) {
        _uid = _authResult.user!.uid;
        _email = _authResult.user!.email.toString();
        retVal = "Success";
      }
    } catch (e) {
      retVal = e.toString();
    }

    return retVal;
  }

  Future<String> loginUserWithgoogle() async {
    String retVal = "error";
    GoogleSignIn _googlesignin = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    try {
      GoogleSignInAccount? _googleUser = await _googlesignin.signIn();
      GoogleSignInAuthentication _googleAuth =
          await _googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);
      UserCredential _authResult = await _auth.signInWithCredential(credential);
      if (_authResult.user != null) {
        _uid = _authResult.user!.uid;
        _email = _authResult.user!.email.toString();
        retVal = "Success";
      }
    } catch (e) {
      retVal = e.toString();
    }

    return retVal;
  }
}
