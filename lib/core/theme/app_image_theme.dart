import 'package:flutter/material.dart';

class AppImageTheme extends ThemeExtension<AppImageTheme> {
  final String logo;
  final String background;

  AppImageTheme({
    this.logo = 'assets/light.png',
    this.background = 'assets/background.jpg',
  });
  AppImageTheme.dark()
      : logo = 'assets/dark.png',
        background = 'assets/background_dark.jpg';
  @override
  AppImageTheme copyWith({
    String? logo,
    String? background,
  }) {
    return AppImageTheme(
      logo: logo ?? this.logo,
      background: background ?? this.background,
    );
  }

  @override
  ThemeExtension<AppImageTheme> lerp(
    covariant ThemeExtension<AppImageTheme>? other,
    double t,
  ) {
    if (other == null) {
      return this;
    }
    return AppImageTheme();
  }
}
