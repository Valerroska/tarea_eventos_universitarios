import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF9E9E)),
      scaffoldBackgroundColor: const Color(0xFFFFF1F3),
      //appBarTheme: const AppBarTheme(centerTitle: false, elevation: 0),
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Color(0xFFFFB38A),
        foregroundColor: Colors.white,
      ),
      /*cardTheme: const CardThemeData(
        elevation: 2,
        margin: EdgeInsets.zero,
      ),*/
      cardTheme: const CardThemeData(
        elevation: 4,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
      ),
    );
  }
}
