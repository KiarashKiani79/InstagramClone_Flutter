import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'device_size.dart';

String? getFontFamily() {
  return GoogleFonts.roboto().fontFamily;
}

ThemeData customThemeData({
  required bool isDarkTheme,
  required BuildContext context,
}) {
  return ThemeData(
// Font theme
    fontFamily: getFontFamily(),

// Material-3 Enabled
    useMaterial3: true,

// Brightness
    brightness: isDarkTheme ? Brightness.dark : Brightness.light,

// Scaffold color
    scaffoldBackgroundColor:
        isDarkTheme ? darkScaffoldColor : lightScaffoldColor,

// Color scheme
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      // primary: AppColors.primaryColor,
      secondary: secondaryColor,
      error: errorColor,
    ),

// App bar theme
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            isDarkTheme ? Brightness.light : Brightness.dark,
        statusBarBrightness: isDarkTheme ? Brightness.light : Brightness.dark,
        systemNavigationBarColor:
            isDarkTheme ? darkScaffoldColor : lightScaffoldColor,
        systemNavigationBarIconBrightness:
            isDarkTheme ? Brightness.light : Brightness.dark,
      ),
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: isDarkTheme ? Colors.white : Colors.black,
        fontSize: Device.largeTextSize,
        fontWeight: FontWeight.bold,
        fontFamily: getFontFamily(),
      ),
    ),

// Icon theme
    iconTheme: isDarkTheme
        ? const IconThemeData(color: lightScaffoldColor)
        : const IconThemeData(color: darkScaffoldColor),

// Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      // filled: true,
      alignLabelWithHint: true,
      contentPadding: const EdgeInsets.all(10),
      hintStyle: TextStyle(
        color: isDarkTheme
            ? Colors.white.withOpacity(0.33)
            : Colors.black.withOpacity(0.33),
        fontSize: Device.smallTextSize,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
