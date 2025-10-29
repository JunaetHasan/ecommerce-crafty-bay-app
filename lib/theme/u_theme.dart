import 'package:crafty_bay/theme/u_elevatedButton_theme.dart';
import 'package:crafty_bay/theme/u_input_decoration-theme.dart';
import 'package:crafty_bay/theme/u_text_theme.dart';
import 'package:flutter/material.dart';

class UTheme {
  UTheme._();

  static ThemeData ligthTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: UTextTheme.ligthTheme,
    elevatedButtonTheme: UElevatedButtonTheme.ligthElevatedButtonTheme,
    inputDecorationTheme: UInputDecorationTheme.ligthInputTheme

  );

}