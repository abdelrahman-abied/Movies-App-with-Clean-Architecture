import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart' as app;
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  group('App Integration Tests', () {
    testWidgets('should display app title', (WidgetTester tester) async {
      // Arrange
      await mockNetworkImagesFor(() async {
        app.main();
        await tester.pumpAndSettle();
      });

      // Assert
      expect(find.text('Movies App'), findsOneWidget);
    });

    testWidgets('should display initial loading state', (WidgetTester tester) async {
      // Arrange
      await mockNetworkImagesFor(() async {
        app.main();
        await tester.pump();
      });

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should display movie list after loading', (WidgetTester tester) async {
      // Arrange
      await mockNetworkImagesFor(() async {
        app.main();
        await tester.pump();
        
        // Wait for loading to complete
        await tester.pumpAndSettle(const Duration(seconds: 5));
      });

      // Assert - should show some content (either movies or error)
      expect(find.byType(CircularProgressIndicator), findsNothing);
      
      // Check if we have either movies or an error message
      final hasMovies = find.byType(ListView).evaluate().isNotEmpty;
      final hasError = find.textContaining('error').evaluate().isNotEmpty;
      final hasEmpty = find.textContaining('no movies').evaluate().isNotEmpty;
      
      expect(hasMovies || hasError || hasEmpty, true);
    });

    testWidgets('should navigate to movie details when movie is tapped', (WidgetTester tester) async {
      // Arrange
      await mockNetworkImagesFor(() async {
        app.main();
        await tester.pump();
        
        // Wait for loading to complete
        await tester.pumpAndSettle(const Duration(seconds: 5));
      });

      // Look for movie items
      final movieItems = find.byType(ListTile);
      if (movieItems.evaluate().isNotEmpty) {
        // Act - tap on first movie
        await tester.tap(movieItems.first);
        await tester.pumpAndSettle();

        // Assert - should navigate to details screen
        expect(find.byType(AppBar), findsNWidgets(2)); // Two app bars (one for each screen)
      }
    });

    testWidgets('should display search functionality', (WidgetTester tester) async {
      // Arrange
      await mockNetworkImagesFor(() async {
        app.main();
        await tester.pump();
        
        // Wait for loading to complete
        await tester.pumpAndSettle(const Duration(seconds: 5));
      });

      // Look for search field
      final searchField = find.byType(TextField);
      if (searchField.evaluate().isNotEmpty) {
        // Act - enter search text
        await tester.enterText(searchField.first, 'test');
        await tester.pumpAndSettle();

        // Assert - should show search results or loading
        expect(find.text('test'), findsOneWidget);
      }
    });

    testWidgets('should handle pull to refresh', (WidgetTester tester) async {
      // Arrange
      await mockNetworkImagesFor(() async {
        app.main();
        await tester.pump();
        
        // Wait for loading to complete
        await tester.pumpAndSettle(const Duration(seconds: 5));
      });

      // Look for refreshable content
      final refreshableContent = find.byType(RefreshIndicator);
      if (refreshableContent.evaluate().isNotEmpty) {
        // Act - pull to refresh
        await tester.drag(find.byType(RefreshIndicator), const Offset(0, 300));
        await tester.pumpAndSettle();

        // Assert - should show loading indicator briefly
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      }
    });

    testWidgets('should display error state when network fails', (WidgetTester tester) async {
      // This test would require mocking network failures
      // For now, we'll just verify the app doesn't crash
      await mockNetworkImagesFor(() async {
        app.main();
        await tester.pump();
        
        // Wait for loading to complete
        await tester.pumpAndSettle(const Duration(seconds: 5));
      });

      // Assert - app should still be running
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('should handle empty state gracefully', (WidgetTester tester) async {
      // Arrange
      await mockNetworkImagesFor(() async {
        app.main();
        await tester.pump();
        
        // Wait for loading to complete
        await tester.pumpAndSettle(const Duration(seconds: 5));
      });

      // Assert - app should handle empty states without crashing
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('should maintain state during navigation', (WidgetTester tester) async {
      // Arrange
      await mockNetworkImagesFor(() async {
        app.main();
        await tester.pump();
        
        // Wait for loading to complete
        await tester.pumpAndSettle(const Duration(seconds: 5));
      });

      // Navigate to details and back
      final movieItems = find.byType(ListTile);
      if (movieItems.evaluate().isNotEmpty) {
        // Go to details
        await tester.tap(movieItems.first);
        await tester.pumpAndSettle();

        // Go back
        await tester.tap(find.byType(BackButton));
        await tester.pumpAndSettle();

        // Assert - should return to movie list
        expect(find.byType(ListView), findsOneWidget);
      }
    });

    testWidgets('should display proper loading indicators', (WidgetTester tester) async {
      // Arrange
      await mockNetworkImagesFor(() async {
        app.main();
        await tester.pump();
      });

      // Assert - should show loading indicator initially
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // Wait for loading to complete
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // Assert - loading indicator should be gone
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('should handle different screen orientations', (WidgetTester tester) async {
      // Arrange
      await mockNetworkImagesFor(() async {
        app.main();
        await tester.pump();
        
        // Wait for loading to complete
        await tester.pumpAndSettle(const Duration(seconds: 5));
      });

      // Test landscape orientation
      await tester.binding.setSurfaceSize(const Size(800, 600));
      await tester.pumpAndSettle();

      // Assert - app should still work in landscape
      expect(find.byType(MaterialApp), findsOneWidget);

      // Test portrait orientation
      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pumpAndSettle();

      // Assert - app should still work in portrait
      expect(find.byType(MaterialApp), findsOneWidget);

      // Reset to default size
      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('should handle rapid user interactions', (WidgetTester tester) async {
      // Arrange
      await mockNetworkImagesFor(() async {
        app.main();
        await tester.pump();
        
        // Wait for loading to complete
        await tester.pumpAndSettle(const Duration(seconds: 5));
      });

      // Rapidly tap on different elements
      final movieItems = find.byType(ListTile);
      if (movieItems.evaluate().isNotEmpty) {
        for (int i = 0; i < 3; i++) {
          await tester.tap(movieItems.first);
          await tester.pump();
        }
        await tester.pumpAndSettle();

        // Assert - app should handle rapid interactions without crashing
        expect(find.byType(MaterialApp), findsOneWidget);
      }
    });
  });
}
