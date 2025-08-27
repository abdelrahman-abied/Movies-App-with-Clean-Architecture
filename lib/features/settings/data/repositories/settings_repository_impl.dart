import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/settings.dart';
import '../../domain/repositories/settings_repository.dart';

/// Concrete implementation of SettingsRepository
class SettingsRepositoryImpl implements SettingsRepository {
  final SharedPreferences _prefs;

  SettingsRepositoryImpl(this._prefs);

  static const String _themeKey = 'app_theme';
  static const String _languageKey = 'app_language';

  @override
  Future<Settings> getSettings() async {
    try {
      final themeIndex = _prefs.getInt(_themeKey) ?? 0;
      final languageCode = _prefs.getString(_languageKey) ?? 'en';

      final themeMode = _getThemeModeFromIndex(themeIndex);

      return Settings.fromThemeAndLanguage(themeMode, languageCode);
    } catch (e) {
      return Settings.defaults();
    }
  }

  @override
  Future<void> saveSettings(Settings settings) async {
    try {
      await _prefs.setInt(_themeKey, _getIndexFromThemeMode(settings.themeMode));
      await _prefs.setString(_languageKey, settings.languageCode);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateThemeMode(ThemeMode themeMode) async {
    try {
      final currentSettings = await getSettings();
      final newSettings = currentSettings.copyWith(themeMode: themeMode);
      await saveSettings(newSettings);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateLanguage(String languageCode) async {
    try {
      final currentSettings = await getSettings();
      final newSettings = currentSettings.copyWith(languageCode: languageCode);
      await saveSettings(newSettings);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> toggleTheme() async {
    try {
      final currentSettings = await getSettings();
      final newThemeMode = currentSettings.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

      await updateThemeMode(newThemeMode);
    } catch (e) {
      rethrow;
    }
  }

  ThemeMode _getThemeModeFromIndex(int index) {
    switch (index) {
      case 0:
        return ThemeMode.light;
      case 1:
        return ThemeMode.dark;
      case 2:
        return ThemeMode.system;
      default:
        return ThemeMode.light;
    }
  }

  int _getIndexFromThemeMode(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return 0;
      case ThemeMode.dark:
        return 1;
      case ThemeMode.system:
        return 2;
    }
  }
}
