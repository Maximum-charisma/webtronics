import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Color.fromRGBO(242, 242, 247, 1),
  cardColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.red,
    foregroundColor: Colors.white,
    shadowColor: Colors.black.withOpacity(0.2),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 18,
    ),
  ),
  textTheme: const TextTheme().apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.white,
  backgroundColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  cardColor: Colors.grey[900],
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    shadowColor: Colors.black.withOpacity(0.2),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 18,
    ),
  ),
  textTheme: const TextTheme().apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
);
