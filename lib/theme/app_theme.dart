import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryOrange = Color(0xFFFBB03B);
  static const Color gradientMid = Color(0xFFFFA821);
  static const Color gradientEnd = Color(0xFFEC0C43);
  static const Color lightGray = Color(0xFF8E8E93);
  static const Color darkGray = Color(0xFF3C3C43);

  static ThemeData get lightTheme => ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.black,
    textTheme: TextTheme(
      headlineLarge: const TextStyle(
        fontFamily: 'ClashDisplay',
        fontSize: 48,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: darkGray,
        height: 1.6,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: lightGray,
      ),
    ),
  );
}
