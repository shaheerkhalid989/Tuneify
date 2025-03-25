import 'package:flutter/material.dart';
import 'package:musicslly_app/core/configs/theme/app_colors.dart';

//---------------------------- Light Theme ----------------------------------

class AppTheme {
  static final lightTheme = ThemeData(
    extensions: <ThemeExtension<dynamic>>[
      PageIndicatorTheme(
        activeDotColor: Colors.black,
        dotColor: Colors.grey,
      ),
    ],
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      elevation: 0,
    ),
    brightness: Brightness.light,
    fontFamily: 'Satoshi',
    // ------------------------------------------------------
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Satoshi',
          shadows: [
            BoxShadow(
              color: Color(0x7F000000),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    ),
    // ------------------------------------------------------
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor:
            const Color.fromRGBO(192, 192, 192, 1).withOpacity(0.3),
        textStyle: const TextStyle(
          color: AppColors.primary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Satoshi',
          shadows: [
            BoxShadow(
              color: Color(0x7F000000),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        side: BorderSide(color: AppColors.lightGreen, width: 3),
      ),
    ),
    // ------------------------------------------------------
    textTheme: TextTheme(
      bodyLarge: TextStyle(
          color: AppColors.primary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Satoshi'),
      bodyMedium: TextStyle(
          color: Colors.black87.withOpacity(0.7),
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Satoshi'),
      headlineLarge: TextStyle(
          color: AppColors.blackClr,
          fontSize: 32,
          fontWeight: FontWeight.bold,
          fontFamily: 'Satoshi'),
    ),
    //----------------------------------------------------------------
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
        color: Colors.black26,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Satoshi',
      ),
      labelStyle: TextStyle(
        color: AppColors.primary,
        fontSize: 17,
        fontWeight: FontWeight.bold,
        fontFamily: 'Satoshi',
      ),
      fillColor: Colors.transparent,
      contentPadding: const EdgeInsets.all(25),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: AppColors.primary.withOpacity(0.7), width: 2.5),
        borderRadius: BorderRadius.circular(30),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: AppColors.blackClr.withOpacity(0.8), width: 0.8),
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );

//---------------------------- Dark Theme ----------------------------------

  static final darkTheme = ThemeData(
    extensions: <ThemeExtension<dynamic>>[
      PageIndicatorTheme(
        activeDotColor: Colors.white,
        dotColor: Colors.grey,
      ),
    ],
    primaryColor: AppColors.lightGreen,
    scaffoldBackgroundColor: AppColors.darkBackground,
    brightness: Brightness.dark,
    fontFamily: 'Satoshi',
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      elevation: 0,
    ),
    // ------------------------------------------------------
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Satoshi',
          shadows: [
            BoxShadow(
              color: Color(0x7F000000),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    ),
    // ------------------------------------------------------
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.grey.withOpacity(0.3),
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Satoshi',
          shadows: [
            BoxShadow(
              color: Color(0x7F000000),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        side: BorderSide(color: AppColors.lightGreen, width: 3),
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
          color: AppColors.lightGreen,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Satoshi'),
      bodyMedium: TextStyle(
          color: Colors.white70.withOpacity(0.9),
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Satoshi'),
      headlineLarge: TextStyle(
          color: AppColors.whiteClr,
          fontSize: 32,
          fontWeight: FontWeight.bold,
          fontFamily: 'Satoshi'),
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusColor: AppColors.lightGreen,
      hintStyle: const TextStyle(
        color: Colors.white24,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'Satoshi',
      ),
      labelStyle: TextStyle(
        color: AppColors.lightGreen,
        fontSize: 17,
        fontWeight: FontWeight.bold,
        fontFamily: 'Satoshi',
      ),
      fillColor: Colors.transparent,
      contentPadding: const EdgeInsets.all(25),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: AppColors.lightGreen.withOpacity(0.7), width: 2.5),
        borderRadius: BorderRadius.circular(30),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: AppColors.whiteClr.withOpacity(0.8), width: 0.8),
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
}

//----------------------------------------------------------------

class PageIndicatorTheme extends ThemeExtension<PageIndicatorTheme> {
  final Color activeDotColor;
  final Color dotColor;

  PageIndicatorTheme({required this.activeDotColor, required this.dotColor});

  @override
  PageIndicatorTheme copyWith({Color? activeDotColor, Color? dotColor}) {
    return PageIndicatorTheme(
      activeDotColor: activeDotColor ?? this.activeDotColor,
      dotColor: dotColor ?? this.dotColor,
    );
  }

  @override
  PageIndicatorTheme lerp(ThemeExtension<PageIndicatorTheme>? other, double t) {
    if (other is! PageIndicatorTheme) {
      return this;
    }
    return PageIndicatorTheme(
      activeDotColor: Color.lerp(activeDotColor, other.activeDotColor, t)!,
      dotColor: Color.lerp(dotColor, other.dotColor, t)!,
    );
  }
}
