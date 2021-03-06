import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islands_counter/resources/color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: ColorManager.primary,
    textTheme: TextTheme(
      headline1: GoogleFonts.karla(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: ColorManager.blackText,
      ),
      bodyText1: GoogleFonts.karla(
        fontSize: 16,
        color: ColorManager.blackText,
      ),
      headline2: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: Colors.black,
      ),
      bodyText2: GoogleFonts.poppins(
        fontSize: 16,
        color: Colors.black,
      ),
    ),
  );
}
