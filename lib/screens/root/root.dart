import 'package:flutter/material.dart';
import 'package:myquiz/screens/home/home.dart';
import 'package:myquiz/screens/login/login.dart';
import 'package:myquiz/states/currentuser.dart';
import 'package:provider/provider.dart';

enum AuthStatus {
  notloggedIn,
  loggedIn,
  check,
}

class MyRoot extends StatefulWidget {
  @override
  State<MyRoot> createState() => _MyRootState();
}

class _MyRootState extends State<MyRoot> {
  AuthStatus _authStatus = AuthStatus.check;

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await _currentUser.onStartup();
    print(_returnString);
    if (_returnString == 'Success') {
      setState(() {
        _authStatus = AuthStatus.loggedIn;
      });
    } else {
      setState(() {
        _authStatus = AuthStatus.notloggedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget retVal = _CPI();
    switch (_authStatus) {
      case AuthStatus.notloggedIn:
        retVal = MyLogin();
        break;
      case AuthStatus.loggedIn:
        retVal = HomeScreen();
        break;
      default:
    }
    return retVal;
  }
}

Widget _CPI() {
  return const Scaffold(
    body: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
