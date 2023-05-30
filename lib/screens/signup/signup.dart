import 'package:flutter/material.dart';
import 'package:myquiz/screens/login/localWidgets/loginForm.dart';
import 'package:myquiz/screens/signup/localWidgets/signupform.dart';

class MySignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                MySignupForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
