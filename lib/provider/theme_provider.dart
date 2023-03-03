

import 'package:flutter/material.dart';
import 'package:psmna10/settings/styles_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData? _themeData;
  ThemeProvider(int id_tema, BuildContext context) {
    setThemeData(id_tema, context);
  }

  getThemeData() => this._themeData;
  setThemeData(int? index, BuildContext context) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    switch (index){
      case 1:
        _themeData=StylesSettings.dark(context);
        sharedPreferences.setInt('id_tema', 1);
        await sharedPreferences.setBool('is_dark', true);
        break; 
      case 2:
        _themeData=StylesSettings.personal(context);
        sharedPreferences.setInt('id_tema', 2);
        break;
      default:
        _themeData=StylesSettings.light(context);
        sharedPreferences.setInt('id_tema', 0);
        await sharedPreferences.setBool('is_dark', false);
        break;
    }
    notifyListeners();
  }
}