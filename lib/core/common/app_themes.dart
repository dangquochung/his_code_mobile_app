import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.lightPrimaryColor,
      surface: AppColors.primaryBgColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.textColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryBgColor,
    ),
    scaffoldBackgroundColor: AppColors.primaryBgColor,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'Inter',
        color: AppColors.textColor,
        fontVariations: [
          FontVariation('wght', 400), // Default weight
        ],
        decorationColor: AppColors.primaryColor,
      ),
      bodyMedium: TextStyle(
          fontFamily: 'Inter',
          color: AppColors.textColor,
          fontVariations: [
            FontVariation('wght', 400), // Default weight
          ],
          decorationColor: AppColors.primaryColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.hintColor),
        // Default border color
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.hintColor),
        // Enabled border color
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
        // Focused border color
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red), // Error border color
        borderRadius: BorderRadius.circular(8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red), // Focused error border color
        borderRadius: BorderRadius.circular(8),
      ),
      labelStyle: const TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.hintColor,
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white; // Active thumb color
        }
        return Colors.grey[50]; // Inactive thumb color
      }),
      trackColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryColor; // Active track color
        }
        return Colors.grey[200]; // Inactive track color
      }),
      trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryColor; // Active track color
        }
        return Colors.grey[200]; // Inactive track color
      }),
      materialTapTargetSize: MaterialTapTargetSize.padded,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Colors.blueGrey,
      secondary: Colors.tealAccent,
      background: Color(0xFF121212),
      // Dark background color
      surface: Color(0xFF1E1E1E),
      // Darker surface color
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onBackground: Colors.white,
      onSurface: Colors.white,
    ),
    // Customize other properties as needed
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'Inter',
        color: Colors.white,
        fontVariations: [
          FontVariation('wght', 700), // Default weight
        ],
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Inter',
        color: Colors.white,
        fontVariations: [
          FontVariation('wght', 400), // Default weight
        ],
      ),
    ),
  );
}
