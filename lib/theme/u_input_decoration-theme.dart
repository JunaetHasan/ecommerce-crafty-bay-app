
import 'package:flutter/material.dart';

class UInputDecorationTheme {
  UInputDecorationTheme._();

  static InputDecorationThemeData ligthInputTheme = InputDecorationThemeData(
    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      //borderSide: BorderSide(color: Colors.blue)
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(),
      borderRadius: BorderRadius.circular(10),
    ),
  );

  static InputDecorationThemeData darkInputTheme = InputDecorationThemeData(
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(),
    disabledBorder: OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(),
  );
}
