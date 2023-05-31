import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myquiz/screens/login/login.dart';
import 'package:myquiz/screens/root/root.dart';
import 'package:myquiz/states/currentuser.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyQuiz"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Sign Out"),
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 97, 194, 162),
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: () async {
            CurrentUser _currentUser = Provider.of(context, listen: false);
            String _retString = await _currentUser.onSignOut();
            if (_retString == "Success") {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => MyRoot(),
                ),
                (Route<dynamic> route) => false,
              );
            }
          },
        ),
      ),
    );
  }
}
