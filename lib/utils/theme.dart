import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyTheme {
  ThemeData buildTheme() {
    Color _appbar = Color.fromARGB(255, 97, 194, 162);
    Color _lightgreen = Color.fromARGB(255, 213, 235, 220);
    Color _lightgrey = Color.fromARGB(255, 164, 164, 164);
    Color _darkergrey = Color.fromARGB(255, 119, 124, 135);
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: _appbar,
      ),
      canvasColor: _lightgreen,
      primaryColor: Colors.white70,
      accentColor: _lightgrey,
      secondaryHeaderColor: _darkergrey,
      hintColor: _lightgrey,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: _lightgrey,
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
