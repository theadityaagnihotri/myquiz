import 'package:flutter/material.dart';
import 'package:myquiz/screens/login/login.dart';
import 'package:provider/provider.dart';

import '../../../states/currentuser.dart';

import '../../../widgets/myContainer.dart';

class MySignupForm extends StatefulWidget {
  @override
  State<MySignupForm> createState() => _MySignupFormState();
}

class _MySignupFormState extends State<MySignupForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _cnfPasswordController = TextEditingController();

  void _signupUser(String email, String password, BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      if (await _currentUser.signupUser(email, password)) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => MyLogin(),
          ),
          (Route<dynamic> route) => false,
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 8,
            ),
            child: Text(
              "Sign Up!",
              style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person_outline),
              hintText: 'Name',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.alternate_email),
              hintText: 'Email',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline),
              hintText: 'Password',
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _cnfPasswordController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_open),
              hintText: 'Confirm Password',
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 213, 235, 220),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              minimumSize: Size(200, 50),
            ),
            onPressed: () {
              if (_passwordController.text == _cnfPasswordController.text) {
                _signupUser(
                    _emailController.text, _passwordController.text, context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Password do not match"),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
          ),
          TextButton(
            child: Text("Log in here!"),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => MyLogin(),
                ),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
