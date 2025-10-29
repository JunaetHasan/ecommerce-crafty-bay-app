import 'package:flutter/material.dart';

class UTextTheme {

  UTextTheme._();

  static TextTheme ligthTheme = TextTheme(
    titleLarge: TextStyle().copyWith(fontSize: 18,fontWeight: FontWeight.w500),
    titleMedium: TextStyle().copyWith(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),
    titleSmall: TextStyle().copyWith(fontSize: 12,color: Colors.grey.shade900),

  );
}