import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/theme/app_theme.dart';
import 'features/movies/presentation/screens/movie_list_screen.dart';
import 'features/settings/presentation/providers/settings_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferences
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      // Use a more stable approach - only watch the settings state once
      final settingsState = ref.watch(settingsStateProvider);

      return MaterialApp(
        title: 'Movies App',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: settingsState.when(
          data: (settings) => settings.themeMode,
          loading: () => ThemeMode.light,
          error: (_, __) => ThemeMode.light,
        ),
        locale: settingsState.when(
          data: (settings) => Locale(settings.languageCode),
          loading: () => const Locale('en'),
          error: (_, __) => const Locale('en'),
        ),
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: const MovieListScreen(),
      );
    });
  }
}
