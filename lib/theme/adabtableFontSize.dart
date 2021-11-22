// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'responsive.dart';

class FlexTextStyle {
  /// Return font size according to screen
  static TextTheme getStyle(BuildContext context) {
     if (ResponsiveWidget.isMobileScreen(context)) {
      /// Mobile Screen 350-500 px
      return TextTheme(
        headline1: GoogleFonts.openSans(fontSize: 36, fontWeight: FontWeight.w300), 
        headline2: GoogleFonts.openSans(fontSize: 28, fontWeight: FontWeight.w300), 
        headline3: GoogleFonts.openSans(fontSize: 24, fontWeight: FontWeight.w400),
        bodyText1: GoogleFonts.openSans(fontSize: 20, fontWeight: FontWeight.w400), 
        bodyText2: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w400),
      );
    } else if (ResponsiveWidget.isSmallScreen(context)) {
      /// Small Screen 500-800 px
      return TextTheme(
        headline1: GoogleFonts.openSans(fontSize: 52, fontWeight: FontWeight.w300),
        headline2: GoogleFonts.openSans(fontSize: 42, fontWeight: FontWeight.w300),
        headline3: GoogleFonts.openSans(fontSize: 30, fontWeight: FontWeight.w400),
        bodyText1: GoogleFonts.openSans(fontSize: 22, fontWeight: FontWeight.w400),
        bodyText2: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w400),
      );
    } else {
      /// Screen >800 px
      return TextTheme(
        headline1: GoogleFonts.openSans(fontSize: 52, fontWeight: FontWeight.w300),
        headline2: GoogleFonts.openSans(fontSize: 42, fontWeight: FontWeight.w300),
        headline3: GoogleFonts.openSans(fontSize: 30, fontWeight: FontWeight.w400),
        bodyText1: GoogleFonts.openSans(fontSize: 22, fontWeight: FontWeight.w400),
        bodyText2: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w400),
      );
    }
  }
}
