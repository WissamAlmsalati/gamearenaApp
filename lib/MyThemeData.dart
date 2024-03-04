import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

final ThemeData MyTheme = ThemeData(
  primaryColor: Vx.yellow100,
  hintColor: Colors.black,
  backgroundColor: Colors.grey[200],
  scaffoldBackgroundColor: Colors.white,
  fontFamily: GoogleFonts.rubik().fontFamily,
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
