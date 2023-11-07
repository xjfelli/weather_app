import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.openSans(
        fontSize: 97,
        color: Colors.black,
        fontWeight: FontWeight.w300,
      ),
      displayMedium: GoogleFonts.openSans(
        fontSize: 61,
        color: Colors.black,
        fontWeight: FontWeight.w300,
      ),
      displaySmall: GoogleFonts.openSans(
        fontSize: 48,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: GoogleFonts.openSans(
        fontSize: 34,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: GoogleFonts.openSans(
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: GoogleFonts.openSans(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: GoogleFonts.openSans(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: GoogleFonts.openSans(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: GoogleFonts.openSans(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.openSans(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: GoogleFonts.openSans(
        fontSize: 12,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: GoogleFonts.openSans(
        fontSize: 14.sp,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: GoogleFonts.openSans(
        fontSize: 10,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    ));

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black54,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.openSans(
        fontSize: 97,
        color: Colors.white,
        fontWeight: FontWeight.w300,
      ),
      displayMedium: GoogleFonts.openSans(
        fontSize: 61,
        color: Colors.white,
        fontWeight: FontWeight.w300,
      ),
      displaySmall: GoogleFonts.openSans(
        fontSize: 48,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: GoogleFonts.openSans(
        fontSize: 34,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: GoogleFonts.openSans(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: GoogleFonts.openSans(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: GoogleFonts.openSans(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: GoogleFonts.openSans(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: GoogleFonts.openSans(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.openSans(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: GoogleFonts.openSans(
        fontSize: 12,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: GoogleFonts.openSans(
        fontSize: 14.sp,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: GoogleFonts.openSans(
        fontSize: 10,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    ));
