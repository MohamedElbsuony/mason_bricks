import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/core/design_system/colors_palette/app_main_colors.dart';

class AppColorsPalette {
  AppColorsPalette._();

  static const Color primary = AppMainColors.primary;
  static const Color secondary = AppMainColors.secondary;
  static const Color backgroundLight = AppMainColors.background;
  static const Color backgroundDark = Color(0xFF121212);
  static const Color textPrimaryLight = Color(0xFF212121);
  static const Color textPrimaryDark = Color(0xFFEEEEEE);
}
