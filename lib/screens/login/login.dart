import 'package:flutter/material.dart';
import 'package:myquiz/screens/login/localWidgets/loginForm.dart';

class MyLogin extends StatelessWidget {
  const MyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(20),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(80),
                    child: Container(
                        child: Image.asset("assets/logo.png"),
                        height: 200,
                        width: 200),
                  ),
                  MyLoginForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
