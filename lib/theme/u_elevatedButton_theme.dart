import 'package:flutter/material.dart';

class UElevatedButtonTheme {
  UElevatedButtonTheme._();

  static ElevatedButtonThemeData ligthElevatedButtonTheme =
  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 13),
      //padding: EdgeInsets.symmetric(),
      foregroundColor: Colors.white,
      side: BorderSide(color: Colors.blue),
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: TextStyle(color: Colors.white, fontSize: 13),
    ),
  );

  static ElevatedButtonThemeData darkElevatedButtonTheme =
  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      textStyle: TextStyle(color: Colors.white, fontSize: 13),
    ),
  );
}