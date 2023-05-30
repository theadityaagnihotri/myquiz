import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyTheme {
  ThemeData buildTheme() {
    Color _lightgrey = Color.fromARGB(255, 164, 164, 164);
    Color _darkergrey = Color.fromARGB(255, 119, 124, 135);
    return ThemeData(
      canvasColor: Colors.white70,
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
