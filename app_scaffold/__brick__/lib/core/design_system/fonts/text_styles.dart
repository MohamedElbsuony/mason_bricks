import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/core/design_system/fonts/font_family.dart';
import 'package:{{project_name.snakeCase()}}/core/design_system/fonts/font_sizes.dart';

class TextStyles {
  TextStyles._();

  static const TextStyle bodySmall = TextStyle(
    fontFamily: FontFamily.mainFont,
    fontSize: FontSizes.s12,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: FontFamily.mainFont,
    fontSize: FontSizes.s14,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: FontFamily.mainFont,
    fontSize: FontSizes.s18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: FontFamily.mainFont,
    fontSize: FontSizes.s24,
    fontWeight: FontWeight.bold,
  );
}
