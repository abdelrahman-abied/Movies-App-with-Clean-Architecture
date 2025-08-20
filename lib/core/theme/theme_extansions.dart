import 'package:flutter/material.dart';
import  'app_color_theme.dart';
import  'app_gradient_theme.dart';
import  'app_image_theme.dart';
import  'app_shadow_theme.dart';
import  'app_text_theme.dart';

extension ThemeDataExtension on ThemeData {
  AppColorTheme get colorTheme => extension<AppColorTheme>() ?? AppColorTheme();

  AppShadowTheme get appShadowTheme => extension<AppShadowTheme>() ?? AppShadowTheme();

  AppGradientTheme get appGradientTheme =>
      extension<AppGradientTheme>() ?? AppGradientTheme.generate(colorScheme: colorScheme);

  AppTextTheme get appTextTheme => extension<AppTextTheme>() ?? AppTextTheme();

  AppImageTheme get appImageTheme => extension<AppImageTheme>() ?? AppImageTheme();
}

extension BuildContextExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  AppColorTheme get colorTheme => Theme.of(this).colorTheme;

  AppShadowTheme get appShadowTheme => Theme.of(this).appShadowTheme;

  AppGradientTheme get appGradientTheme => Theme.of(this).appGradientTheme;

  AppTextTheme get appTextTheme => Theme.of(this).appTextTheme;

  AppImageTheme get appImageTheme => Theme.of(this).appImageTheme;
}
