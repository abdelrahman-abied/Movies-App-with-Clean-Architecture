// import 'package:dio/dio.dart';
// import 'dio_client.dart';

// // Example of how to use the authenticated Dio client
// // This can be used when you need to implement authentication in your app

// class AuthDioExample {
//   // Example token storage (in real app, use secure storage)
//   static String? _accessToken;
//   static String? _refreshToken;

//   // Example token getters
//   static String? getAccessToken() => _accessToken;
//   static String? getRefreshToken() => _refreshToken;

//   // Example refresh token function
//   static Future<String?> refreshAccessToken(String refreshToken) async {
//     try {
//       // In a real app, this would make an API call to refresh the token
//       // For now, we'll just simulate it
//       await Future.delayed(const Duration(seconds: 1));

//       // Simulate successful token refresh
//       _accessToken = 'new_access_token_${DateTime.now().millisecondsSinceEpoch}';
//       return _accessToken;
//     } catch (e) {
//       // Token refresh failed
//       _accessToken = null;
//       _refreshToken = null;
//       return null;
//     }
//   }

//   // Example of creating an authenticated Dio client
//   static Dio createAuthenticatedClient() {
//     return DioClient.createAuthenticatedDio(
//       baseUrl: 'https://api.example.com',
//       getAccessToken: getAccessToken,
//       getRefreshToken: getRefreshToken,
//       refreshAccessToken: refreshAccessToken,
//       onTokenExpired: () {
//         // Handle token expiration (e.g., navigate to login screen)
//         print('Token expired - redirecting to login');
//         _accessToken = null;
//         _refreshToken = null;
//       },
//       onAuthFailed: () {
//         // Handle authentication failure (e.g., clear tokens and redirect)
//         print('Authentication failed - clearing tokens');
//         _accessToken = null;
//         _refreshToken = null;
//       },
//       enableLogging: true,
//       enableRetry: true,
//     );
//   }

//   // Example of setting tokens (in real app, this would be done after login)
//   static void setTokens(String accessToken, String refreshToken) {
//     _accessToken = accessToken;
//     _refreshToken = refreshToken;
//   }

//   // Example of clearing tokens (in real app, this would be done after logout)
//   static void clearTokens() {
//     _accessToken = null;
//     _refreshToken = null;
//   }
// }

// // Example usage in a provider
// /*
// final authenticatedDioProvider = Provider<Dio>((ref) {
//   return AuthDioExample.createAuthenticatedClient();
// });

// final authenticatedApiServiceProvider = Provider<AuthenticatedApiService>((ref) {
//   final dio = ref.watch(authenticatedDioProvider);
//   return AuthenticatedApiService(dio);
// });
// */
