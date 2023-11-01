import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.deepPurple.shade300,
    primary: Colors.deepPurple.shade200,
    secondary: Colors.deepPurple.shade400,
    inversePrimary: Colors.deepPurple.shade500,
  ),
  textTheme: ThemeData.light().textTheme.apply(
        bodyColor: Colors.deepPurple[700],
        displayColor: Colors.black,
      ),
);
