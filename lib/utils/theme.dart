import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyTheme {
  ThemeData buildTheme() {
    Color appbar = Color.fromARGB(255, 97, 194, 162);
    Color lightgreen = Color.fromARGB(255, 213, 235, 220);
    Color lightgrey = Color.fromARGB(255, 164, 164, 164);
    Color darkergrey = Color.fromARGB(255, 119, 124, 135);
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: appbar,
      ),
      buttonColor: appbar,
      primaryColorDark: appbar,
      canvasColor: lightgreen,
      primaryColor: Colors.white70,
      accentColor: lightgrey,
      secondaryHeaderColor: darkergrey,
      hintColor: lightgrey,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: lightgrey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
