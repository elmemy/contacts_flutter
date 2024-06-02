import 'package:chat_demo/core/error/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ServerException', () {
    test('should return the correct message', () {
      final message = 'Server error occurred';
      final exception = ServerException(message);

      expect(exception.message, equals(message));
    });

    test('should be an instance of Exception', () {
      final exception = ServerException('Server error occurred');

      expect(exception, isA<Exception>());
    });
  });

  group('CacheException', () {
    test('should return the correct message', () {
      final message = 'Cache error occurred';
      final exception = CacheException(message);

      expect(exception.message, equals(message));
    });

    test('toString should return the correct message', () {
      final message = 'Cache error occurred';
      final exception = CacheException(message);

      expect(exception.toString(), equals(message));
    });

    test('should be an instance of Exception', () {
      final exception = CacheException('Cache error occurred');

      expect(exception, isA<Exception>());
    });
  });
}
