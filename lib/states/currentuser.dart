import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class CurrentUser extends ChangeNotifier {
  String _uid = "";
  String _email = "";

  String get getuid => _uid;
  String get getEmail => _email;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signupUser(String email, String password) async {
    bool retVal = false;

    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (_authResult.user != null) {
        retVal = true;
      }
    } catch (e) {
      print(e);
    }

    return retVal;
  }

  Future<bool> loginUser(String email, String password) async {
    bool retVal = false;

    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (_authResult.user != null) {
        _uid = _authResult.user!.uid;
        _email = _authResult.user!.email.toString();
        retVal = true;
      }
    } catch (e) {
      print(e);
    }

    return retVal;
  }
}
