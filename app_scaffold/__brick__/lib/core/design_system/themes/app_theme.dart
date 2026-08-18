import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/core/design_system/colors_palette/app_colors_palette.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColorsPalette.primary,
      scaffoldBackgroundColor: AppColorsPalette.backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: AppColorsPalette.primary,
        secondary: AppColorsPalette.secondary,
      ),
      useMaterial3: true,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColorsPalette.primary,
      scaffoldBackgroundColor: AppColorsPalette.backgroundDark,
      colorScheme: const ColorScheme.dark(
        primary: AppColorsPalette.primary,
        secondary: AppColorsPalette.secondary,
      ),
      useMaterial3: true,
    );
  }
}
