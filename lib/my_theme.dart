import 'package:flutter/material.dart';

class MyThemeData {
  static const Color lightColor = Colors.blue;
  static const Color darkColor = Color(0xFF060e1e);
  static const Color greenColor = Colors.green;
  static const Color scafoldColor =Color(0xFFdfecdb);
  static const Color whiteColor =Colors.white;

  static ThemeData lightTheme = ThemeData(
    primaryColor: lightColor,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ),
    scaffoldBackgroundColor: Color(0xFFdfecdb),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: false,
      selectedLabelStyle: TextStyle(fontSize: 12),
      unselectedLabelStyle: TextStyle(fontSize: 12),
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        )
        ),
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: lightColor,
        onPrimary: Colors.white,
        secondary: Colors.green,
        onSecondary: Colors.grey,
        error: Colors.red,
        onError: Colors.white,
        surface: Colors.white,
        onSurface: Colors.black),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: darkColor,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF141922),
      selectedItemColor: lightColor,
      unselectedItemColor: Colors.white,
      showUnselectedLabels: false,
      selectedLabelStyle: TextStyle(fontSize: 12),
      unselectedLabelStyle: TextStyle(fontSize: 12),
    ),
    scaffoldBackgroundColor: darkColor,
    appBarTheme: AppBarTheme(
      backgroundColor: lightColor,
      titleTextStyle: TextStyle(
        fontSize: 30,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      )
    ),
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: darkColor,
        onPrimary: Colors.black26,
        secondary: Colors.green,
        onSecondary: lightColor,
        error: Colors.red,
        onError: Colors.white,
        surface: Colors.white,
        onSurface: Color(0xFF141922)),
  );

}
