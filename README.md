# Movie App with Flutter

A Flutter application built with Clean Architecture, Riverpod for state management, and Flutter Retrofit for API calls. The app fetches movie data from The Movie Database (TMDB) API and handles various error scenarios including network connectivity issues.

## Features

- **Clean Architecture**: Follows Clean Architecture principles with clear separation of concerns
- **State Management**: Uses Riverpod for reactive state management
- **API Integration**: Flutter Retrofit for HTTP requests to TMDB API
- **Error Handling**: Comprehensive error handling for network, server, and general errors
- **Offline Support**: Detects network connectivity and shows appropriate error messages
- **Responsive UI**: Material Design 3 with responsive grid layout
- **Pull to Refresh**: Swipe down to refresh movie data
- **Pagination**: Infinite scroll with automatic loading of more movies
- **Tab Navigation**: Popular Movies and Top Rated Movies tabs
- **Advanced HTTP Handling**: Custom Dio interceptors for authentication, retry logic, and logging
- **Token Management**: Automatic token refresh and authentication handling

## Architecture

The app follows Clean Architecture principles with the following layers:

### Core Layer
- **Error Handling**: Custom failure and exception classes
- **Network**: Connectivity checking, network information, and Dio interceptors
- **Use Cases**: Base use case interface

### Features Layer (Movies)
- **Data Layer**: 
  - Models (JSON serializable)
  - Data Sources (API service with Retrofit)
  - Repositories (Implementation of domain repositories)
- **Domain Layer**:
  - Entities (Business objects)
  - Repositories (Interfaces)
  - Use Cases (Business logic)
- **Presentation Layer**:
  - State Management (Riverpod providers and notifiers)
  - Screens (UI screens)
  - Widgets (Reusable UI components)

## HTTP Interceptors

The app includes advanced HTTP interceptors for enhanced API handling:

### AuthInterceptor
- **Automatic Token Management**: Adds authorization headers to requests
- **Token Refresh**: Automatically refreshes expired access tokens
- **Request Retry**: Retries failed requests with new tokens
- **Error Handling**: Converts HTTP errors to custom exceptions

### LoggingInterceptor
- **Request Logging**: Logs all HTTP requests with headers and data
- **Response Logging**: Logs successful responses
- **Error Logging**: Detailed error logging with response data
- **Configurable**: Can be enabled/disabled as needed

### RetryInterceptor
- **Automatic Retry**: Retries failed requests on specific error codes
- **Exponential Backoff**: Implements progressive retry delays
- **Configurable**: Customizable retry counts and status codes
- **Smart Retry**: Only retries on appropriate error types

### DioClient Factory
- **Pre-configured Clients**: Factory methods for different use cases
- **Interceptor Management**: Automatically configures interceptors
- **Movie API Client**: Pre-configured for TMDB API
- **Authenticated Client**: Ready for future authentication features

## Setup Instructions

### 1. Get TMDB API Key
1. Visit [The Movie Database](https://www.themoviedb.org/)
2. Create an account and log in
3. Go to Settings > API
4. Request an API key for developer use
5. Copy your API key

### 2. Update API Key
Open `lib/features/movies/presentation/providers/movie_providers.dart` and replace:
```dart
const String tmdbApiKey = 'YOUR_TMDB_API_KEY_HERE';
```
with your actual API key.

### 3. Install Dependencies
```bash
flutter pub get
```

### 4. Generate Code
The app uses code generation for JSON serialization and Retrofit. Run:
```bash
flutter packages pub run build_runner build
```

### 5. Run the App
```bash
flutter run
```

## Error Handling

The app handles various error scenarios:

### Network Errors
- **No Internet Connection**: Shows wifi-off icon with retry button
- **Connection Timeout**: Shows timer-off icon with retry button
- **Connection Errors**: Shows error icon with retry button

### Server Errors
- **401 Unauthorized**: Shows lock icon with retry button
- **404 Not Found**: Shows search-off icon with retry button
- **500 Internal Server Error**: Shows cloud-off icon with retry button

### General Errors
- **Validation Errors**: Shows error icon with retry button
- **Unknown Errors**: Shows generic error message with retry button

## Authentication & Token Management

### Current Implementation
- **Public API**: TMDB API doesn't require authentication for public endpoints
- **API Key**: Uses query parameter authentication

### Future Authentication Features
The app is prepared for future authentication with:

```dart
// Example of creating an authenticated client
final authenticatedDio = DioClient.createAuthenticatedDio(
  baseUrl: 'https://api.example.com',
  getAccessToken: () => 'your_access_token',
  getRefreshToken: () => 'your_refresh_token',
  refreshAccessToken: (refreshToken) async {
    // Implement token refresh logic
    return 'new_access_token';
  },
  onTokenExpired: () {
    // Handle token expiration
  },
  onAuthFailed: () {
    // Handle authentication failure
  },
);
```

### Token Refresh Flow
1. **Request Made**: API request with access token
2. **Token Expired**: Server returns 401 Unauthorized
3. **Auto Refresh**: Interceptor automatically refreshes token
4. **Request Retry**: Original request retried with new token
5. **Success**: User gets response without interruption

## State Management

The app uses Riverpod for state management with the following providers:

- **Movie Repository**: Handles data operations
- **Use Case Providers**: Business logic providers
- **State Providers**: UI state management
- **Network Providers**: Connectivity and API service providers

## API Endpoints

The app uses the following TMDB API endpoints:

- `GET /movie/popular` - Get popular movies
- `GET /movie/top_rated` - Get top rated movies
- `GET /movie/now_playing` - Get now playing movies
- `GET /movie/upcoming` - Get upcoming movies
- `GET /movie/{id}` - Get movie details
- `GET /search/movie` - Search movies

## Dependencies

### Core Dependencies
- `flutter_riverpod`: State management
- `dio`: HTTP client
- `retrofit`: API client generation
- `json_annotation`: JSON serialization
- `connectivity_plus`: Network connectivity
- `equatable`: Value equality
- `dartz`: Functional programming (Either type)

### UI Dependencies
- `cached_network_image`: Image caching
- `shimmer`: Loading placeholders

### Development Dependencies
- `build_runner`: Code generation
- `retrofit_generator`: Retrofit code generation
- `json_serializable`: JSON serialization code generation

## Project Structure

```
lib/
├── core/
│   ├── error/
│   │   ├── failures.dart
│   │   └── exceptions.dart
│   ├── network/
│   │   ├── network_info.dart
│   │   ├── dio_interceptor.dart
│   │   ├── dio_client.dart
│   │   └── auth_dio_example.dart
│   └── usecases/
│       └── usecase.dart
├── features/
│   └── movies/
│       ├── data/
│       │   ├── datasources/
│       │   │   └── movie_api_service.dart
│       │   ├── models/
│       │   │   ├── movie_model.dart
│       │   │   ├── movie_response_model.dart
│       │   │   ├── movie_detail_model.dart
│       │   │   ├── movie_mapper.dart
│       │   │   └── movie_detail_mapper.dart
│       │   └── repositories/
│       │       └── movie_repository_impl.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   ├── movie.dart
│       │   │   └── movie_detail.dart
│       │   ├── repositories/
│       │   │   └── movie_repository.dart
│       │   └── usecases/
│       │       ├── get_popular_movies.dart
│       │       ├── get_top_rated_movies.dart
│       │       └── search_movies.dart
│       └── presentation/
│           ├── providers/
│           │   └── movie_providers.dart
│           ├── screens/
│           │   └── movie_list_screen.dart
│           ├── state/
│           │   ├── movie_state.dart
│           │   ├── movie_notifier.dart
│           │   └── search_movies_notifier.dart
│           └── widgets/
│               ├── movie_card.dart
│               └── error_widget.dart
├── l10n/
│   ├── app_en.arb
│   └── app_ar.arb
└── main.dart
```

## Localization

The app supports multiple languages:
- English (en)
- Arabic (ar)

Localization files are located in the `lib/l10n/` directory.

## Testing

To run tests:
```bash
flutter test
```

## Building

### Android
```bash
flutter build apk
```

### iOS
```bash
flutter build ios
```

### Web
```bash
flutter build web
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is licensed under the MIT License.

## Acknowledgments

- [The Movie Database (TMDB)](https://www.themoviedb.org/) for providing the movie API
- [Flutter](https://flutter.dev/) for the amazing framework
- [Riverpod](https://riverpod.dev/) for state management
- [Retrofit](https://pub.dev/packages/retrofit) for API client generation
- [Dio](https://pub.dev/packages/dio) for HTTP client and interceptors
