import 'package:flutter/material.dart';
import 'package:flutter_app/ui/theme/brand_colors.dart';

@immutable
class AppTheme {
  static const textColorRed = Color(0xFFE5484D);
  static const errorBorderColor = Color(0xFFE5484D);
  static const errorBackgroundColor = Color(0xFFFDECEC);

  static ThemeData get light {
    const primaryColor = Color(0xFF1F5F5B);
    const backgroundColor = Color(0xFFF6F4F0);
    const textColorDark = Color(0xFF1A1A1A);
    const textColorGrey = Color(0xFF6B6B6B);
    const borderColor = Color(0xFFECE8E1);
    const borderSelectedColor = Color(0xFFE6F0EF);
    const appBarBackgroundColor = Colors.white;
    const cardBackgroundColor = Colors.white;

    final colorScheme = ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.light,
      primary: primaryColor,
      error: textColorRed,
      errorContainer: errorBackgroundColor,
      surface: backgroundColor,
      onSurface: textColorGrey,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: backgroundColor,

      fontFamily: 'Inter',
      extensions: [
        BrandColors(
          primary: primaryColor,
          background: backgroundColor,
          textDark: textColorDark,
          textGrey: textColorGrey,
          textRed: textColorRed,
          border: borderColor,
          errorBorder: errorBorderColor,
          errorBackground: errorBackgroundColor,
          borderSelected: borderSelectedColor,
          appBarBackgroundColor: appBarBackgroundColor,
          cardBackgroundColor: cardBackgroundColor,
        ),
      ],

      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: textColorDark,
        ),
        bodyLarge: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: textColorGrey,
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),

      inputDecorationTheme: const InputDecorationThemeData(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 14),
        labelStyle: TextStyle(color: textColorGrey),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
          elevation: 0,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
      ),

      chipTheme: const ChipThemeData(
        backgroundColor: Colors.white,
        selectedColor: primaryColor,
        showCheckmark: false,
        side: BorderSide(color: borderSelectedColor, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),

      iconTheme: const IconThemeData(color: primaryColor, size: 24),
    );
  }

  static ThemeData get dark {
    const primaryColor = Color(0xFF80CBC4);
    const backgroundColor = Color(0xFF1C1C1E);
    const textColorDark = Color(0xFFF2F2F7);
    const textColorGrey = Color(0xFFA1A1A5);
    const borderColor = Color(0xFF353538);
    const borderSelectedColor = Color(0xFF1E3B3A);
    const appBarBackgroundColor = Color(0xFF1C1C1E);
    const cardBackgroundColor = Color(0xFF2C2C2E);

    final colorScheme = ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.dark,
      primary: primaryColor,
      error: textColorRed,
      errorContainer: errorBackgroundColor,
      surface: backgroundColor,
      onSurface: textColorGrey,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: backgroundColor,

      fontFamily: 'Inter',
      extensions: [
        BrandColors(
          primary: primaryColor,
          background: backgroundColor,
          textDark: textColorDark,
          textGrey: textColorGrey,
          textRed: textColorRed,
          border: borderColor,
          errorBorder: errorBorderColor,
          errorBackground: errorBackgroundColor,
          borderSelected: borderSelectedColor,
          appBarBackgroundColor: appBarBackgroundColor,
          cardBackgroundColor: cardBackgroundColor,
        ),
      ],

      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: textColorDark,
        ),
        bodyLarge: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: textColorGrey,
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),

      inputDecorationTheme: const InputDecorationThemeData(
        filled: true,
        fillColor: cardBackgroundColor,
        contentPadding: EdgeInsets.symmetric(horizontal: 14),
        labelStyle: TextStyle(color: textColorGrey),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: cardBackgroundColor,
          minimumSize: const Size(double.infinity, 56),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
          elevation: 0,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
      ),

      chipTheme: const ChipThemeData(
        backgroundColor: cardBackgroundColor,
        selectedColor: primaryColor,
        showCheckmark: false,
        side: BorderSide(color: borderSelectedColor, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),

      iconTheme: const IconThemeData(color: primaryColor, size: 24),
    );
  }
}
