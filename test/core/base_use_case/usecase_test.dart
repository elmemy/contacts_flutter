import 'package:chat_demo/core/base_use_cases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:chat_demo/core/error/failures.dart';

import 'usecase_test.mocks.dart';

@GenerateMocks([BaseUseCase])
void main() {
  late MockBaseUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockBaseUseCase();
  });

  final testParams = ParamsExample(param: 'test');
  final testResult = 'test_result';

  test('should return the result when the UseCase is called with the correct parameters', () async {
    // Arrange
    when(mockUseCase.call(any))
        .thenAnswer((_) async => Right(testResult));

    // Act
    final result = await mockUseCase.call(testParams);

    // Assert
    expect(result, Right(testResult));
    verify(mockUseCase.call(testParams));
    verifyNoMoreInteractions(mockUseCase);
  });

  test('should return a Failure when the UseCase server fails', () async {
    // Arrange
    final failure = ServerFailure('Server Error');
    when(mockUseCase.call(any))
        .thenAnswer((_) async => Left(failure));

    // Act
    final result = await mockUseCase.call(testParams);

    // Assert
    expect(result, Left(failure));
    verify(mockUseCase.call(testParams));
    verifyNoMoreInteractions(mockUseCase);
  });
}

// Define a ParamsExample class for testing purposes
class ParamsExample {
  final String param;

  ParamsExample({required this.param});
}
