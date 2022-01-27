import 'package:flutter/material.dart';
import 'package:timer/screens/timer_list_screen.dart';
import 'package:timer/services/constants.dart';

void main() {
  runApp(
    MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      home: const TimerListScreen(),
    ),
  );
}
