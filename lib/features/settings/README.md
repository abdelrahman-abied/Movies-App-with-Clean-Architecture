# Settings Feature

This feature handles user preferences including theme and language settings, following Clean Architecture principles.

## Structure

```
lib/features/settings/
├── domain/
│   ├── entities/
│   │   └── settings.dart                    # Core settings data structure
│   ├── repositories/
│   │   └── settings_repository.dart         # Abstract repository interface
│   └── usecases/
│       ├── get_settings.dart                # Get current settings
│       ├── update_theme.dart                # Update theme mode
│       ├── update_language.dart             # Update language
│       └── toggle_theme.dart                # Toggle between light/dark
├── data/
│   └── repositories/
│       └── settings_repository_impl.dart    # Concrete repository implementation
└── presentation/
    ├── providers/
    │   └── settings_providers.dart          # Riverpod providers
    └── screens/
        └── settings_screen.dart             # Settings UI
```

## Features

### 🎨 Theme Management
- **Light Theme**: Clean, bright interface
- **Dark Theme**: Easy on the eyes, modern look
- **System Theme**: Automatically follows device settings
- **Immediate Updates**: Theme changes apply instantly
- **Persistence**: Theme preference saved to SharedPreferences

### 🌍 Localization Support
- **English (en)**: Default language
- **Arabic (ar)**: Right-to-left support
- **Dynamic Switching**: Language changes apply immediately
- **Persistence**: Language preference saved to SharedPreferences

### 💾 Data Persistence
- Uses SharedPreferences for local storage
- Automatic loading of saved preferences
- Fallback to defaults if storage fails
- Error handling with graceful degradation

## Clean Architecture Implementation

### 1. Domain Layer
- **Entities**: Pure business objects (Settings)
- **Repository Interface**: Abstract contract for data operations
- **Use Cases**: Business logic for settings operations

### 2. Data Layer
- **Repository Implementation**: Concrete implementation using SharedPreferences
- **Data Persistence**: Handles saving/loading preferences

### 3. Presentation Layer
- **Providers**: Riverpod state management
- **UI Components**: Clean, responsive settings interface
- **State Management**: Reactive updates with error handling

## Usage

### Accessing Settings
```dart
// In your widget
Consumer(
  builder: (context, ref, child) {
    final settings = ref.watch(settingsStateProvider);
    // Use settings data
  },
)
```

### Theme Management
```dart
// Toggle theme
ref.read(settingsStateProvider.notifier).toggleTheme();

// Set specific theme
ref.read(settingsStateProvider.notifier).updateTheme(ThemeMode.dark);
```

### Language Management
```dart
// Update language
ref.read(settingsStateProvider.notifier).updateLanguage('ar');
```

### Navigation to Settings
```dart
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) => const SettingsScreen(),
  ),
);
```

## Integration with Main App

The settings feature integrates seamlessly with the main app:

1. **Theme Integration**: `themeModeProvider` provides current theme mode
2. **Language Integration**: `languageCodeProvider` provides current language
3. **MaterialApp Configuration**: Automatically applies theme and locale
4. **Global State**: Settings are available throughout the app

## Benefits

1. **Clean Separation**: Each layer has a specific responsibility
2. **Testability**: Business logic can be tested independently
3. **Maintainability**: Easy to modify and extend
4. **Reusability**: Settings logic can be reused across the app
5. **Error Handling**: Graceful fallbacks and user feedback
6. **Performance**: Efficient state management with Riverpod

## Future Enhancements

- Additional theme options (custom colors, fonts)
- More language support
- User profile settings
- Backup/restore preferences
- Cloud synchronization
