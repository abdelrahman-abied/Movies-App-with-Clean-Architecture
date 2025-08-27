import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/usecases/usecase.dart';
import '../../data/repositories/settings_repository_impl.dart';
import '../../domain/entities/settings.dart';
import '../../domain/repositories/settings_repository.dart';
import '../../domain/usecases/get_settings.dart';
import '../../domain/usecases/toggle_theme.dart';
import '../../domain/usecases/update_language.dart';
import '../../domain/usecases/update_theme.dart';

/// Provider for SharedPreferences
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences must be initialized before use');
});

/// Provider for settings repository
final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return SettingsRepositoryImpl(prefs);
});

/// Provider for get settings use case
final getSettingsProvider = Provider<GetSettings>((ref) {
  final repository = ref.watch(settingsRepositoryProvider);
  return GetSettings(repository);
});

/// Provider for update theme use case
final updateThemeProvider = Provider<UpdateTheme>((ref) {
  final repository = ref.watch(settingsRepositoryProvider);
  return UpdateTheme(repository);
});

/// Provider for update language use case
final updateLanguageProvider = Provider<UpdateLanguage>((ref) {
  final repository = ref.watch(settingsRepositoryProvider);
  return UpdateLanguage(repository);
});

/// Provider for toggle theme use case
final toggleThemeProvider = Provider<ToggleTheme>((ref) {
  final repository = ref.watch(settingsRepositoryProvider);
  return ToggleTheme(repository);
});

/// Provider for settings state
final settingsStateProvider = StateNotifierProvider<SettingsNotifier, AsyncValue<Settings>>((ref) {
  final getSettings = ref.watch(getSettingsProvider);
  final repository = ref.watch(settingsRepositoryProvider);
  return SettingsNotifier(getSettings, repository);
});

/// Provider for theme mode (for MaterialApp)
final themeModeProvider = Provider<ThemeMode>((ref) {
  try {
    final settingsState = ref.read(settingsStateProvider);
    if (settingsState.hasValue) {
      return settingsState.value!.themeMode;
    }
    return ThemeMode.light;
  } catch (e) {
    return ThemeMode.light;
  }
});

/// Provider for language code (for MaterialApp)
final languageCodeProvider = Provider<String>((ref) {
  try {
    final settingsState = ref.read(settingsStateProvider);
    if (settingsState.hasValue) {
      return settingsState.value!.languageCode;
    }
    return 'en';
  } catch (e) {
    return 'en';
  }
});

/// State notifier for settings management
class SettingsNotifier extends StateNotifier<AsyncValue<Settings>> {
  final GetSettings _getSettings;
  final SettingsRepository _repository;

  SettingsNotifier(this._getSettings, this._repository) : super(const AsyncValue.loading()) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    state = const AsyncValue.loading();
    try {
      final result = await _getSettings(const NoParams());
      result.fold(
        (failure) => state = AsyncValue.error(failure, StackTrace.current),
        (settings) => state = AsyncValue.data(settings),
      );
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> updateTheme(ThemeMode themeMode) async {
    if (state.hasValue) {
      final currentSettings = state.value!;
      final newSettings = currentSettings.copyWith(themeMode: themeMode);

      state = AsyncValue.data(newSettings);

      try {
        await _repository.updateThemeMode(themeMode);
      } catch (e) {
        // Revert on error
        state = AsyncValue.data(currentSettings);
      }
    }
  }

  Future<void> updateLanguage(String languageCode) async {
    if (state.hasValue) {
      final currentSettings = state.value!;
      final newSettings = currentSettings.copyWith(languageCode: languageCode);

      state = AsyncValue.data(newSettings);

      try {
        await _repository.updateLanguage(languageCode);
      } catch (e) {
        // Revert on error
        state = AsyncValue.data(currentSettings);
      }
    }
  }

  Future<void> toggleTheme() async {
    if (state.hasValue) {
      final currentSettings = state.value!;
      final newThemeMode = currentSettings.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

      await updateTheme(newThemeMode);
    }
  }
}
