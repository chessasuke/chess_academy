import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

final appThemeProvider = ChangeNotifierProvider<AppDynamicTheme>((ref) {
  return AppDynamicTheme();
});

class AppDynamicTheme extends ChangeNotifier {
  AppDynamicTheme();

  static bool isDark = false;

  void toggle() {
    isDark = !isDark;
    notifyListeners();
  }

  ThemeData getTheme() {
    return isDark ? darkTheme : lightTheme;
  }

  /// LIGHT
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
      primary: const Color(0xFF2274F2),
      primaryVariant: const Color(0xFF0039CB),
      onPrimary: Colors.white,
      secondary: const Color(0xFF616161),
      secondaryVariant: const Color(0xFF373737),
      onSecondary: Colors.white,
      surface: const Color(0xFFE1E2E1),
      onSurface: Colors.black,
      background: const Color(0xFFF5F5F6),
      onBackground: Colors.black,
      error: Colors.redAccent.shade400,
      onError: Colors.red,
      brightness: Brightness.light,
    ),
    primaryTextTheme: TextTheme(
      /// Titles (Extremely Large text)
      headline1: GoogleFonts.openSans(
          fontWeight: FontWeight.w300, color: Colors.black, fontSize: 52),

      /// Subtitles (Very Large Text)
      headline2: GoogleFonts.openSans(
          fontWeight: FontWeight.w300,
          color: Colors.black,
          fontSize: 42), // description
      headline3: GoogleFonts.openSans(
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontSize: 30), // description
      /// Standard text for small screen
      bodyText1: GoogleFonts.openSans(
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontSize: 22), // normal
      /// Standard text for large screen
      bodyText2: GoogleFonts.openSans(
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontSize: 14), // normal
    ),
  );

  /// DARK
  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
      primary: const Color(0xFF2274F2),
      primaryVariant: const Color(0xFF0039CB),
      // primary: Color(0xFFce93d8),
      // primaryVariant: Color(0xFF9c64a6),
      onPrimary: Colors.black,
      secondary: const Color(0xFFea80fc),
      secondaryVariant: const Color(0xFFb64fc8),
      onSecondary: Colors.black,
      surface: const Color(0xFF484848),
      onSurface: const Color(0xFFDCDCDC),
      background: const Color(0xFF121212),
      onBackground: const Color(0xFFE1E1E1),
      error: Colors.redAccent.shade400,
      onError: Colors.red,
      brightness: Brightness.dark,
    ),
    primaryTextTheme: TextTheme(
      /// Titles (Extremely Large text)
      headline1: GoogleFonts.openSans(
          fontWeight: FontWeight.w300, color: Colors.white, fontSize: 52),

      /// Subtitles (Very Large Text)
      headline2: GoogleFonts.openSans(
          fontWeight: FontWeight.w300,
          color: Colors.white,
          fontSize: 42), // description
      headline3: GoogleFonts.openSans(
          fontWeight: FontWeight.w400,
          color: Colors.white,
          fontSize: 30), // description
      /// Standard text for small screen
      bodyText1: GoogleFonts.openSans(
          fontWeight: FontWeight.w400,
          color: Colors.white,
          fontSize: 22), // normal
      /// Standard text for large screen
      bodyText2: GoogleFonts.openSans(
          fontWeight: FontWeight.w400,
          color: Colors.white,
          fontSize: 14), // normal
    ),
  );
}
