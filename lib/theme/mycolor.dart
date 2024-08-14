import 'package:flutter/material.dart';

const appPink = Color(0xFFAD1457);

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: appPink,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: appPink,
  ),
);

ThemeData light = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: appPink,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: appPink,
  ),
);
