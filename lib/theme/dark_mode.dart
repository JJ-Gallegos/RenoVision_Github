import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade800,
    primary: Colors.grey.shade700,
    secondary: Colors.grey.shade600,
    inversePrimary: Colors.grey.shade400,
  ),
  textTheme: ThemeData.dark().textTheme.apply(
        bodyColor: Colors.grey[600],
        displayColor: Colors.white,
      ),
);
