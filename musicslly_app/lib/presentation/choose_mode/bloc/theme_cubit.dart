import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system) {
    _updateSystemUIOverlayStyle(state);
  }

  void updateTheme(ThemeMode themeMode) {
    emit(themeMode);
    _updateSystemUIOverlayStyle(themeMode);
  }

  void _updateSystemUIOverlayStyle(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(
      themeMode == ThemeMode.dark
          ? SystemUiOverlayStyle.light // Light icons for dark mode
          : SystemUiOverlayStyle.dark, // Dark icons for light mode
    );
  }

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    final themeString = json['theme'] as String?;
    if (themeString == null) return null;

    switch (themeString) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    late String themeString;
    switch (state) {
      case ThemeMode.light:
        themeString = 'light';
        break;
      case ThemeMode.dark:
        themeString = 'dark';
        break;
      case ThemeMode.system:
      default:
        themeString = 'system';
        break;
    }
    return {'theme': themeString};
  }
}
