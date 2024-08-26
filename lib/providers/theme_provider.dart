import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode mode = ThemeMode.light;

  void changeTheme(ThemeMode themeMode) {
    mode = themeMode;
    notifyListeners();
  }
}