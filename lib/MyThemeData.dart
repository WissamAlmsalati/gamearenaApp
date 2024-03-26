import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData MyTheme = ThemeData(
  hintColor: Colors.black,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: GoogleFonts.rubik().fontFamily,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Colors.green,
    ),
    headline2: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyText1: TextStyle(
      fontSize: 16,
      color: Colors.black,
    ),
    button: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
);
