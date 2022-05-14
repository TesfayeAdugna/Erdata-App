import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData dark() {
    return ThemeData(
 brightness: Brightness.dark,
 appBarTheme: AppBarTheme(
 foregroundColor: Colors.white,
 backgroundColor: Colors.grey[700],
 ),
 floatingActionButtonTheme: const
FloatingActionButtonThemeData(
 foregroundColor: Colors.white,
 backgroundColor: Colors.green,
 ),
 bottomNavigationBarTheme: const
BottomNavigationBarThemeData(
  backgroundColor: Colors.grey,
  unselectedItemColor: Colors.white,
 selectedItemColor: Colors.amber,
 ),

 );
 }
 static ThemeData light() {
    return ThemeData(
 brightness: Brightness.light,
 appBarTheme: AppBarTheme(
 foregroundColor: Colors.black,
 backgroundColor: Colors.grey[600],
 ),
 floatingActionButtonTheme: const
FloatingActionButtonThemeData(
 foregroundColor: Colors.white,
 backgroundColor: Colors.amber,
 ),
 bottomNavigationBarTheme: const
BottomNavigationBarThemeData(
 selectedItemColor: Colors.amber,
 ),

 );
 }
}