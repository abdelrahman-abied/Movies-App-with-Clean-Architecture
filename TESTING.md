# Testing Guide for Movies App

This document provides comprehensive guidance for testing the Movies application, including unit tests, integration tests, and testing best practices.

## Table of Contents

1. [Overview](#overview)
2. [Testing Architecture](#testing-architecture)
3. [Running Tests](#running-tests)
4. [Unit Testing](#unit-testing)
5. [Integration Testing](#integration-testing)
6. [Test Structure](#test-structure)
7. [Mocking](#mocking)
8. [Test Utilities](#test-utilities)
9. [Best Practices](#best-practices)
10. [Troubleshooting](#troubleshooting)

## Overview

The Movies app uses a comprehensive testing strategy with:
- **Unit Tests**: Testing individual components in isolation
- **Integration Tests**: Testing the complete app flow
- **Freezed**: For immutable data classes and state management
- **Mockito**: For mocking dependencies
- **Riverpod**: For state management testing

## Testing Architecture

```
test/
├── features/
│   └── movies/
│       ├── domain/
│       │   ├── entities/
│       │   │   ├── movie_test.dart
│       │   │   └── movie_detail_test.dart
│       │   └── usecases/
│       │       └── get_popular_movies_test.dart
│       └── presentation/
│           └── state/
│               └── movie_state_test.dart
├── test_config.dart
└── widget_test.dart

integration_test/
└── app_test.dart
```

## Running Tests

### Prerequisites

1. Install dependencies:
```bash
flutter packages get
```

2. Generate mocks (required for unit tests):
```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### Running All Tests

```bash
# Run all unit tests
flutter test

# Run all tests with coverage
flutter test --coverage

# Run tests in a specific directory
flutter test test/features/movies/

# Run a specific test file
flutter test test/features/movies/domain/entities/movie_test.dart
```

### Running Integration Tests

```bash
# Run integration tests
flutter test integration_test/

# Run integration tests on a specific device
flutter test integration_test/ -d chrome
```

### Running Tests with Coverage Report

```bash
# Generate coverage report
flutter test --coverage

# View coverage report (requires lcov)
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## Unit Testing

### Entity Tests

Test domain entities to ensure they work correctly with Freezed:

```dart
test('should create Movie with all properties', () {
  const movie = Movie(
    id: 1,
    title: 'Test Movie',
    overview: 'Test overview',
  );
  
  expect(movie.id, 1);
  expect(movie.title, 'Test Movie');
  expect(movie.overview, 'Test overview');
});

test('should support copyWith', () {
  const movie = Movie(id: 1, title: 'Original Title');
  final updatedMovie = movie.copyWith(title: 'Updated Title');
  
  expect(updatedMovie.title, 'Updated Title');
  expect(updatedMovie.id, 1); // unchanged
});
```

### Use Case Tests

Test business logic in isolation:

```dart
test('should get popular movies from repository', () async {
  // Arrange
  when(mockRepository.getPopularMovies(any))
      .thenAnswer((_) async => const Right(testMovies));

  // Act
  final result = await usecase(testParams);

  // Assert
  expect(result, const Right(testMovies));
  verify(mockRepository.getPopularMovies(testParams.page));
});
```

### State Tests

Test state management with Freezed:

```dart
test('should support when method', () {
  const state = MovieState.loaded(movies: testMovies);
  
  String result = '';
  state.when(
    initial: () => result = 'initial',
    loading: () => result = 'loading',
    loaded: (movies, hasReachedMax, currentPage) => result = 'loaded',
    error: (message, code) => result = 'error',
    empty: () => result = 'empty',
  );

  expect(result, 'loaded');
});
```

## Integration Testing

Integration tests verify the complete app flow:

```dart
testWidgets('should navigate to movie details', (WidgetTester tester) async {
  // Arrange
  await mockNetworkImagesFor(() async {
    app.main();
    await tester.pumpAndSettle();
  });

  // Act
  final movieItems = find.byType(ListTile);
  if (movieItems.evaluate().isNotEmpty) {
    await tester.tap(movieItems.first);
    await tester.pumpAndSettle();
  }

  // Assert
  expect(find.byType(AppBar), findsNWidgets(2));
});
```

## Test Structure

### Test Organization

Follow this structure for each test file:

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([Dependency])
void main() {
  group('ClassName', () {
    late ClassName instance;
    late MockDependency mockDependency;

    setUp(() {
      mockDependency = MockDependency();
      instance = ClassName(mockDependency);
    });

    group('methodName', () {
      test('should do something when condition', () async {
        // Arrange
        when(mockDependency.method()).thenReturn(value);

        // Act
        final result = await instance.method();

        // Assert
        expect(result, expectedValue);
        verify(mockDependency.method()).called(1);
      });
    });
  });
}
```

### Test Naming Convention

Use descriptive test names that follow this pattern:

```dart
test('should [expected behavior] when [condition]', () async {
  // test implementation
});

test('should [expected behavior] with [specific input]', () async {
  // test implementation
});

test('should handle [error condition] gracefully', () async {
  // test implementation
});
```

## Mocking

### Generating Mocks

1. Add `@GenerateMocks([Class1, Class2])` annotation
2. Run build runner:
```bash
flutter packages pub run build_runner build
```

### Using Mocks

```dart
// Setup mock behavior
when(mockRepository.getData(any))
    .thenAnswer((_) async => const Right(testData));

// Verify mock interactions
verify(mockRepository.getData(testParams)).called(1);
verifyNoMoreInteractions(mockRepository);

// Mock exceptions
when(mockRepository.getData(any))
    .thenThrow(Exception('Network error'));
```

## Test Utilities

### TestConfig

Use the centralized test configuration:

```dart
import 'package:flutter_application_1/test/test_config.dart';

// Use predefined test data
final movies = TestConfig.testMovies;
final failure = TestConfig.testServerFailure;

// Create custom test data
final customMovie = TestConfig.createTestMovie(
  title: 'Custom Title',
  voteAverage: 9.0,
);
```

### TestUtils

Use utility functions for common testing operations:

```dart
// Wait for condition
await TestUtils.waitForCondition(
  () => find.byType(ListView).evaluate().isNotEmpty,
  timeout: const Duration(seconds: 5),
);

// Mock response with delay
final result = await TestUtils.mockResponse(
  testData,
  delay: const Duration(milliseconds: 100),
);
```

## Best Practices

### 1. Test Isolation

- Each test should be independent
- Use `setUp()` and `tearDown()` for common setup
- Avoid shared state between tests

### 2. Arrange-Act-Assert Pattern

```dart
test('should do something', () async {
  // Arrange - setup test data and mocks
  when(mock.method()).thenReturn(value);
  
  // Act - execute the method under test
  final result = await instance.method();
  
  // Assert - verify the results
  expect(result, expectedValue);
});
```

### 3. Descriptive Test Names

```dart
// Good
test('should return error when network fails', () async {});

// Bad
test('test1', () async {});
```

### 4. Test Coverage

- Aim for >80% code coverage
- Focus on business logic and edge cases
- Test error conditions and edge cases

### 5. Mock Verification

```dart
// Verify the mock was called correctly
verify(mockRepository.getData(testParams)).called(1);

// Verify no more interactions
verifyNoMoreInteractions(mockRepository);
```

## Troubleshooting

### Common Issues

1. **Mock Generation Fails**
   ```bash
   # Clean and regenerate
   flutter packages pub run build_runner clean
   flutter packages pub run build_runner build
   ```

2. **Tests Fail Due to Network Images**
   ```dart
   // Wrap tests with mockNetworkImagesFor
   await mockNetworkImagesFor(() async {
     // test code
   });
   ```

3. **Freezed Files Not Generated**
   ```bash
   # Ensure freezed dependency is added
   flutter packages get
   flutter packages pub run build_runner build
   ```

4. **Integration Tests Fail**
   - Check device/emulator is running
   - Ensure app can be launched
   - Use longer timeouts for slow operations

### Debugging Tests

1. **Use print statements** (temporary):
   ```dart
   print('Debug: Current state: ${notifier.state}');
   ```

2. **Use debugger**:
   ```dart
   debugger();
   ```

3. **Check test output**:
   ```bash
   flutter test --verbose
   ```

## Continuous Integration

### GitHub Actions Example

```yaml
name: Tests
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.19.0'
      - run: flutter packages get
      - run: flutter packages pub run build_runner build
      - run: flutter test --coverage
      - run: flutter test integration_test/
```

## Performance Testing

### Memory Leak Testing

```dart
test('should not leak memory', () async {
  // Run operation multiple times
  for (int i = 0; i < 100; i++) {
    await instance.operation();
  }
  
  // Force garbage collection
  await Future.delayed(const Duration(milliseconds: 100));
  
  // Verify no memory leaks
  // This is a simplified example - use proper memory profiling tools
});
```

### Performance Benchmarks

```dart
test('should complete operation within time limit', () async {
  final stopwatch = Stopwatch()..start();
  
  await instance.operation();
  
  stopwatch.stop();
  expect(stopwatch.elapsedMilliseconds, lessThan(100));
});
```

## Conclusion

This testing guide provides a comprehensive approach to testing the Movies app. Follow these practices to ensure code quality, maintainability, and reliability. Remember to:

- Write tests for all business logic
- Use mocks for external dependencies
- Test error conditions and edge cases
- Maintain high test coverage
- Follow testing best practices
- Use the provided test utilities and configuration

For additional help, refer to:
- [Flutter Testing Documentation](https://docs.flutter.dev/testing)
- [Mockito Documentation](https://pub.dev/packages/mockito)
- [Freezed Documentation](https://pub.dev/packages/freezed)
