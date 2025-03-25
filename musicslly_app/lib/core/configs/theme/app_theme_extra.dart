import 'package:flutter/material.dart';
import 'package:musicslly_app/core/configs/assets/app_images.dart';
import 'package:musicslly_app/core/configs/theme/app_colors.dart';

//---------------------------- Light Theme ----------------------------------

class AppThemeEx {
  static final lightTheme = ThemeData(
    extensions: <ThemeExtension<dynamic>>[
      CustomDecoration(
        containerDecoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                AppColors.lightBackground.withOpacity(0.35), BlendMode.darken),
            image: AssetImage(AppImages.introBG),
            fit: BoxFit.contain,
          ),
        ),
      ),
      PageIndicatorTheme(
        activeDotColor: Colors.black,
        dotColor: Colors.grey,
      ),
    ],
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
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
  );

//---------------------------- Dark Theme ----------------------------------

  static final darkTheme = ThemeData(
    extensions: <ThemeExtension<dynamic>>[
      CustomDecoration(
        containerDecoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                AppColors.darkBackground.withOpacity(0.35), BlendMode.darken),
            image: AssetImage(AppImages.introBG),
            fit: BoxFit.contain,
          ),
        ),
      ),
      PageIndicatorTheme(
        activeDotColor: Colors.white,
        dotColor: Colors.grey,
      ),
    ],
    primaryColor: AppColors.lightGreen,
    scaffoldBackgroundColor: AppColors.darkBackground,
    brightness: Brightness.dark,
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
  );
}

class CustomDecoration extends ThemeExtension<CustomDecoration> {
  final BoxDecoration containerDecoration;

  CustomDecoration({required this.containerDecoration});

  @override
  CustomDecoration copyWith({BoxDecoration? containerDecoration}) {
    return CustomDecoration(
      containerDecoration: containerDecoration ?? this.containerDecoration,
    );
  }

  @override
  CustomDecoration lerp(ThemeExtension<CustomDecoration>? other, double t) {
    if (other is! CustomDecoration) {
      return this;
    }
    return CustomDecoration(
      containerDecoration: BoxDecoration.lerp(
          containerDecoration, other.containerDecoration, t)!,
    );
  }
}

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
