import 'package:flutter/material.dart';

const COLOR_PRIMARY = Colors.red;

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: COLOR_PRIMARY,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: COLOR_PRIMARY
  )
);

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
);