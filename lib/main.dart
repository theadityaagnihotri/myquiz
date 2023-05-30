import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myquiz/screens/login/login.dart';
import 'package:myquiz/states/currentuser.dart';
import 'package:myquiz/utils/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quiz',
        theme: MyTheme().buildTheme(),
        home: MyLogin(),
      ),
    );
  }
}
