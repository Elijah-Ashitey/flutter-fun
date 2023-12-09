import 'package:flutter/material.dart';

class Themes {
  static const Color bluishClr = Color(0xFF4e5ae8);
  static const Color yellowishClr = Color(0xFFFFB746);
  static const Color pinkClr = Color(0xFFff4667);
  static const Color white = Colors.white;
  static const primaryClr = bluishClr;
  static const Color darkGreyClr = Color(0xFF121212);
  static const Color darkHeaderClr = Color(0xFF424242);

  static final light = ThemeData(
    // responsible for changing the app bar and buttons colors
    primaryColor: primaryClr,
    // responsible for text color, it compares the background color to the text color
    brightness: Brightness.light,
    // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  );

  static final dark = ThemeData(
    // responsible for changing the app bar and buttons colors
    primaryColor: darkGreyClr,
    // responsible for text color, it compares the background color to the text color
    brightness: Brightness.dark,
    useMaterial3: true,
  );
}
