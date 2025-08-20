import 'package:flutter/material.dart';

import 'app_text_style.dart';

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  final TextStyle headline1;
  final TextStyle? headline2;
  final TextStyle? headline3;
  final TextStyle? headline4;

  AppTextTheme({
    this.headline1 = const TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
    this.headline2 = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    this.headline3 = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    this.headline4 = AppTypography.body1,
  });

  AppTextTheme.dark()
      : headline1 = const TextStyle(fontSize: 44, fontWeight: FontWeight.bold, color: Colors.white),
        headline2 = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        headline3 = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        headline4 = const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  ThemeExtension<AppTextTheme> copyWith(
      {TextStyle? headline1, TextStyle? headline2, TextStyle? headline3, TextStyle? headline4}) {
    return AppTextTheme(
      headline1: headline1 ?? this.headline1,
      headline2: headline2 ?? this.headline2,
      headline3: headline3 ?? this.headline3,
      headline4: headline4 ?? this.headline4,
    );
  }

  @override
  ThemeExtension<AppTextTheme> lerp(covariant ThemeExtension<AppTextTheme>? other, double t) {
    if (other == null) {
      return this;
    }
    return AppTextTheme();
  }
}
