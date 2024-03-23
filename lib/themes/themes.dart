import 'package:flutter/material.dart';

class AppThem {
  static ThemeData apptheme = ThemeData(
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 35,
        color: Colors.grey[900],
        fontWeight: FontWeight.w500,
      ),
      subtitle1: TextStyle( color: Colors.grey[900], fontSize: 15),
      headline2: TextStyle(
        color: Colors.grey[900],
        fontSize: 16,
        fontWeight: FontWeight.w400
      ),
      subtitle2: TextStyle(
        color: Colors.grey[900],
        fontSize: 17,
        fontWeight: FontWeight.w300
      ),
      headline3: TextStyle(
        fontSize: 18,
        color: Colors.grey[900],
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        fontSize: 14,
        color: Colors.grey[900],
        fontWeight: FontWeight.w400,
      ),
      headline5: TextStyle(
        fontSize: 15,
        color: Colors.grey[900],
        fontWeight: FontWeight.w500,
      ),
    )
  ) ;
}