import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myquiz/models/user_data.dart';
import 'package:myquiz/services/databse.dart';

import '../services/databse.dart';

class CurrentUser extends ChangeNotifier {
  MyUser _currentUser = MyUser(uid: "", email: "", name: "");

  MyUser get getcurrentUser => _currentUser;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> onStartup() async {
    String retVal = "error";

    try {
      FirebaseAuth user = FirebaseAuth.instance;
      if (user.currentUser != null) {
        retVal = "Success";
      }
    } catch (e) {
      retVal = e.toString();
    }
    return retVal;
  }

  Future<String> onSignOut() async {
    String retVal = "error";
    try {
      await _auth.signOut();
      _currentUser = MyUser(uid: "", email: "", name: "");
      retVal = "Success";
    } catch (e) {
      retVal = e.toString();
    }
    return retVal;
  }

  Future<String> signupUser(String email, String password, String name) async {
    String retVal = "error";
    MyUser _user = MyUser(uid: "", email: "", name: "");
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _user.uid = _authResult.user!.uid;
      _user.email = _authResult.user!.email.toString();
      _user.name = name;
      MyDatabase data = MyDatabase();
      String _retString = await data.createUser(_user);
      if (_retString == "Success") {
        retVal = "Success";
      }
    } catch (e) {
      retVal = e.toString();
    }

    return retVal;
  }

  Future<String> loginUserWithEmail(String email, String password) async {
    String retVal = "error";
    MyDatabase _data = MyDatabase();

    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      _currentUser = await _data.getuserInfo(_authResult.user!.uid);
      if (_currentUser != null) {
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
    MyUser _user = MyUser(uid: "", email: "", name: "");
    MyDatabase _data = MyDatabase();
    try {
      GoogleSignInAccount? _googleUser = await _googlesignin.signIn();
      GoogleSignInAuthentication _googleAuth =
          await _googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);
      UserCredential _authResult = await _auth.signInWithCredential(credential);
      if (_authResult.additionalUserInfo!.isNewUser) {
        _user.uid = _authResult.user!.uid;
        _user.email = _authResult.user!.email.toString();
        _user.name = _authResult.user!.displayName.toString();
        _data.createUser(_user);
      }
      _currentUser = await _data.getuserInfo(_authResult.user!.uid);
      if (_currentUser != null) {
        retVal = "Success";
      }
    } catch (e) {
      retVal = e.toString();
    }

    return retVal;
  }
}
