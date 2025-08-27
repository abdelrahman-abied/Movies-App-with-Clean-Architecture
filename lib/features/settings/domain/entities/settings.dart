import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';

/// Settings entity that represents user preferences
@freezed
abstract class Settings with _$Settings {
  const factory Settings({
    required ThemeMode themeMode,
    required String languageCode,
    required bool isDarkMode,
  }) = _Settings;

  const Settings._();

  /// Create default settings
  factory Settings.defaults() {
    return const Settings(
      themeMode: ThemeMode.light,
      languageCode: 'en',
      isDarkMode: false,
    );
  }

  /// Create settings from theme mode and language
  factory Settings.fromThemeAndLanguage(ThemeMode themeMode, String languageCode) {
    return Settings(
      themeMode: themeMode,
      languageCode: languageCode,
      isDarkMode: themeMode == ThemeMode.dark,
    );
  }
}
