import 'package:chat_demo/core/error/failures.dart';
import 'package:test/test.dart';
import 'package:equatable/equatable.dart';

void main() {
  group('Failure', () {
    test('ServerFailure should be a subclass of Failure and Equatable', () {
      // Arrange
      const message = 'Server error occurred';

      // Act
      final failure = ServerFailure(message);

      // Assert
      expect(failure, isA<Failure>());
      expect(failure, isA<Equatable>());
      expect(failure.message, equals(message));
      expect(failure.props, equals([message]));
    });

    test('CacheFailure should be a subclass of Failure and Equatable', () {
      // Arrange
      const message = 'Cache error occurred';

      // Act
      final failure = CacheFailure(message);

      // Assert
      expect(failure, isA<Failure>());
      expect(failure, isA<Equatable>());
      expect(failure.message, equals(message));
      expect(failure.props, equals([message]));
    });

    test('InvalidInputFailure should be a subclass of Failure and Equatable', () {
      // Arrange
      const message = 'Invalid input error occurred';

      // Act
      final failure = InvalidInputFailure(message);

      // Assert
      expect(failure, isA<Failure>());
      expect(failure, isA<Equatable>());
      expect(failure.message, equals(message));
      expect(failure.props, equals([message]));
    });
  });
}
