import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  static const themeStatus = "THEME_STATUS";
  bool _darkTheme = false;
  bool get getIsDarkTheme => _darkTheme;

  ThemeProvider() {
    getTheme();
  }

// Get theme from shared preferences
  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _darkTheme = prefs.getBool(themeStatus) ?? false;
    notifyListeners();
    return _darkTheme;
  }

// Set theme to shared preferences
  setDarkTheme({required bool themeValue}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(themeStatus, themeValue);
    _darkTheme = themeValue;

    notifyListeners();
  }
}
