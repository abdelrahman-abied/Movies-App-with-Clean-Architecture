import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/settings.dart';
import '../providers/settings_providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(settingsStateProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: settingsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                'Failed to load settings',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => ref.refresh(settingsStateProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
        data: (settings) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildThemeSection(context, ref, settings),
            const SizedBox(height: 24),
            _buildLanguageSection(context, ref, settings),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeSection(BuildContext context, WidgetRef ref, Settings settings) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildThemeOption(
              context,
              ref,
              settings,
              ThemeMode.light,
              'Light',
              Icons.light_mode,
            ),
            _buildThemeOption(
              context,
              ref,
              settings,
              ThemeMode.dark,
              'Dark',
              Icons.dark_mode,
            ),
            _buildThemeOption(
              context,
              ref,
              settings,
              ThemeMode.system,
              'System',
              Icons.settings_system_daydream,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeOption(
    BuildContext context,
    WidgetRef ref,
    Settings settings,
    ThemeMode themeMode,
    String title,
    IconData icon,
  ) {
    final isSelected = settings.themeMode == themeMode;
    
    return ListTile(
      leading: Icon(icon, color: isSelected ? Theme.of(context).colorScheme.primary : null),
      title: Text(title),
      trailing: isSelected ? Icon(Icons.check, color: Theme.of(context).colorScheme.primary) : null,
      onTap: () => ref.read(settingsStateProvider.notifier).updateTheme(themeMode),
      tileColor: isSelected ? Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.1) : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _buildLanguageSection(BuildContext context, WidgetRef ref, Settings settings) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Language',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildLanguageOption(
              context,
              ref,
              settings,
              'en',
              'English',
              '🇺🇸',
            ),
            _buildLanguageOption(
              context,
              ref,
              settings,
              'ar',
              'العربية',
              '🇸🇦',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(
    BuildContext context,
    WidgetRef ref,
    Settings settings,
    String languageCode,
    String title,
    String flag,
  ) {
    final isSelected = settings.languageCode == languageCode;
    
    return ListTile(
      leading: Text(flag, style: const TextStyle(fontSize: 24)),
      title: Text(title),
      trailing: isSelected ? Icon(Icons.check, color: Theme.of(context).colorScheme.primary) : null,
      onTap: () => ref.read(settingsStateProvider.notifier).updateLanguage(languageCode),
      tileColor: isSelected ? Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.1) : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
