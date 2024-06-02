import 'package:chat_demo/core/error/failures.dart';
import 'package:chat_demo/features/login/domain/entities/user.dart';
import 'package:chat_demo/features/login/domain/repositiories/login_repository.dart';
import 'package:chat_demo/features/login/domain/usecases/login_usecase.dart';

import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'login_usecase_test.mocks.dart';

@GenerateMocks([LoginRepository])
void main() {
  late LoginUseCase useCase;
  late MockLoginRepository mockLoginRepository;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    useCase = LoginUseCase(mockLoginRepository);
  });

  group('LoginUseCase', () {
    const username = 'test_user';
    const password = 'test_password';
    final user = User(token: 'test_token');

    test('should return a User when the repository call is successful', () async {
      // Arrange
      when(mockLoginRepository.login(any, any)).thenAnswer((_) async => Right(user));

      // Act
      final result = await useCase(LoginParams(username: username, password: password));

      // Assert
      expect(result, equals(Right(user)));
      verify(mockLoginRepository.login(username, password));
      verifyNoMoreInteractions(mockLoginRepository);
    });

    test('should return a ServerFailure when the repository call fails', () async {
      // Arrange
      when(mockLoginRepository.login(any, any)).thenAnswer((_) async => Left(ServerFailure('Server error')));

      // Act
      final result = await useCase(LoginParams(username: username, password: password));

      // Assert
      expect(result, equals(Left(ServerFailure('Server error'))));
      verify(mockLoginRepository.login(username, password));
      verifyNoMoreInteractions(mockLoginRepository);
    });
  });
}
