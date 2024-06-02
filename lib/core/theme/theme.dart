import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

final ThemeData appTheme = ThemeData(
  primarySwatch: Colors.blue,
  textTheme: TextTheme(
    displayLarge: GoogleFonts.cairo(
      textStyle: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.italic,
      ),
    ),
    titleSmall: GoogleFonts.cairo(
      textStyle: TextStyle(
        fontSize: 14,
        color: blackColor,
        fontWeight: FontWeight.w600,
      ),
    ),
    titleMedium: GoogleFonts.cairo(
      textStyle: TextStyle(
        fontSize: 21.99,
        color: labelColor,
        fontWeight: FontWeight.w700,
      ),
    ),
    labelMedium: GoogleFonts.cairo(
      textStyle: TextStyle(
        fontSize: 16,
        color: titleContacts,
        fontWeight: FontWeight.w400,
      ),
    ),
    labelSmall: GoogleFonts.cairo(
      textStyle: TextStyle(
        fontSize: 12,
        color: labelColor,
        fontWeight: FontWeight.w600,
      ),
    ),
    headlineSmall: GoogleFonts.cairo(
      textStyle: TextStyle(
        fontSize: 12,
        color: grayColor,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: whiteColor,
      foregroundColor: blackColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
    ),
  ),
);
