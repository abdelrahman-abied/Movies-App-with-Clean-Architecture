import 'package:flutter/material.dart';

class MovieErrorWidget extends StatelessWidget {
  final String message;
  final String? code;
  final VoidCallback? onRetry;

  const MovieErrorWidget({
    super.key,
    required this.message,
    this.code,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _getErrorIcon(),
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              _getErrorMessage(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            if (code != null) ...[
              const SizedBox(height: 8),
              Text(
                'Error Code: $code',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ],
            const SizedBox(height: 24),
            if (onRetry != null)
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  IconData _getErrorIcon() {
    if (message.toLowerCase().contains('internet') ||
        message.toLowerCase().contains('connection')) {
      return Icons.wifi_off;
    } else if (message.toLowerCase().contains('server')) {
      return Icons.cloud_off;
    } else if (message.toLowerCase().contains('timeout')) {
      return Icons.timer_off;
    } else if (message.toLowerCase().contains('unauthorized')) {
      return Icons.lock;
    } else if (message.toLowerCase().contains('not found')) {
      return Icons.search_off;
    } else {
      return Icons.error_outline;
    }
  }

  String _getErrorMessage() {
    if (message.toLowerCase().contains('internet') ||
        message.toLowerCase().contains('connection')) {
      return 'No internet connection';
    } else if (message.toLowerCase().contains('server')) {
      return 'Server error occurred';
    } else if (message.toLowerCase().contains('timeout')) {
      return 'Request timeout';
    } else if (message.toLowerCase().contains('unauthorized')) {
      return 'Unauthorized access';
    } else if (message.toLowerCase().contains('not found')) {
      return 'Resource not found';
    } else {
      return message.isNotEmpty ? message : 'Something went wrong';
    }
  }
}
