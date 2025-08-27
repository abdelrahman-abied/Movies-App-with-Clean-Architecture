import 'package:flutter/material.dart';

import '../entities/settings.dart';

/// Abstract settings repository interface
abstract class SettingsRepository {
  /// Get current settings
  Future<Settings> getSettings();

  /// Save settings
  Future<void> saveSettings(Settings settings);

  /// Update theme mode
  Future<void> updateThemeMode(ThemeMode themeMode);

  /// Update language code
  Future<void> updateLanguage(String languageCode);

  /// Toggle theme between light and dark
  Future<void> toggleTheme();
}
