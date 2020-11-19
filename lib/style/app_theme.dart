import 'package:flutter/material.dart';

class AppTheme {
  static shopTheme() {
    return ThemeData(
      primarySwatch: Colors.teal,
      accentColor: Colors.blueGrey,
    );
  }

  static RoundedRectangleBorder roundedBorderDecoration([double radius = 3.0]) {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));
  }
}
