import 'package:flutter/material.dart';

class ApplicationTheme {
  static Color primaryColor = const Color(0xFF39A552);
  static ThemeData lightTheme = ThemeData(
      primaryColor: const Color(0xFF39A552),
      appBarTheme: AppBarTheme(
          color: primaryColor,
          elevation: 0,
          toolbarHeight: 75,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ))),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        titleMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ));
}
