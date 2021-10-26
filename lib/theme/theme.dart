import 'package:flutter/material.dart';

final myThemeDark = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Colors.grey.shade900,
);

final myThemeLight = ThemeData(
  primaryColor: Color.fromRGBO(42, 91, 209, 1),
  scaffoldBackgroundColor: Colors.grey[200],
  fontFamily: 'Montserratcd',
  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromRGBO(42, 91, 209, 1),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color.fromRGBO(42, 91, 209, 1),
    elevation: 0,
  ),
);
