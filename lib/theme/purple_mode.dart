import 'package:flutter/material.dart';

ThemeData purpleMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.deepPurple.shade100,
    primary: Colors.deepPurple.shade200,
    secondary: Colors.deepPurple.shade400,
    inversePrimary: Colors.purple.shade600,
  ),
  textTheme: ThemeData.light().textTheme.apply(
        bodyColor: Colors.purple[800],
        displayColor: Colors.black,
      ),
);
