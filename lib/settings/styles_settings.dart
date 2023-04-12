import 'package:flutter/material.dart';

class StylesSettings {
  static ThemeData darkTheme() {
    return ThemeData.dark();
  }

  static ThemeData lightTheme() {
    return ThemeData.light();
  }

  static ThemeData obscureTheme() {
    return ThemeData.from(
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color.fromARGB(255, 203, 99, 252),
          onPrimary: Colors.white,
          secondary: Color.fromARGB(255, 125, 45, 255),
          onSecondary: Colors.white,
          error: Color.fromARGB(255, 255, 45, 83),
          onError: Colors.white,
          background: Color.fromARGB(255, 199, 157, 193),
          onBackground: Colors.white,
          surface: Color.fromARGB(255, 125, 45, 255),
          onSurface: Colors.white,
        ),
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)));
  }
}
