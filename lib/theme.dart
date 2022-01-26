import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData defaultAppTheme = ThemeData(
  primaryColor: Colors.grey,
  colorScheme: ColorScheme.fromSwatch(accentColor: Colors.black12),
  textTheme: TextTheme(
    headline1: GoogleFonts.lato(
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 20,
      color: Colors.white,
    ),
    headline2: GoogleFonts.lato(
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 18,
      color: Colors.white,
    ),
    headline3: GoogleFonts.lato(
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 14,
      color: const Color.fromRGBO(165, 165, 165, 1),
    ),
    headline4: GoogleFonts.lato(
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 12,
      color: const Color.fromRGBO(216, 54, 54, 1),
    ),
    headline5: GoogleFonts.lato(
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 12,
      color: Colors.white,
    ),
    bodyText1: GoogleFonts.lato(
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 14,
      color: Colors.white,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: const Color.fromRGBO(77, 246, 135, 1),
      onPrimary: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      textStyle: GoogleFonts.lato(
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 12,
      ),
    ),
  ),
);
