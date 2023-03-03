import 'package:flutter/material.dart';

class StylesSettings{
  
  static ThemeData light(BuildContext? context){
    final theme=ThemeData.light();
    return theme.copyWith(
      colorScheme: Theme.of(context!).colorScheme.copyWith(
        primary: Color.fromARGB(255, 148, 218, 161)
      )
    );
  } 

  static ThemeData dark(BuildContext? context){
    final theme=ThemeData.dark();
    return theme.copyWith(
      colorScheme: Theme.of(context!).colorScheme.copyWith(
        primary: Color.fromRGBO(65, 66, 65, 1)
      )
    );
  }

  static ThemeData personal(BuildContext? context){
    return ThemeData.fallback();
  }
}
