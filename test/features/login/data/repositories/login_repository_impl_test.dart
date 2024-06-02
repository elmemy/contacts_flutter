import 'package:chat_demo/core/error/failures.dart';
import 'package:chat_demo/features/login/data/data_source/login_data_source.dart';
import 'package:chat_demo/features/login/data/model/user/user_model.dart';
import 'package:chat_demo/features/login/data/repository/login_repository_impl.dart';
import 'package:chat_demo/features/login/domain/entities/user.dart';
import 'package:chat_demo/features/shared/data/data_source/local_data_source.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_repository_impl_test.mocks.dart';


@GenerateMocks([LoginDataSource, LocalDataSource])
void main() {
  late LoginRepositoryImpl repository;
  late MockLoginDataSource mockLoginDataSource;
  late MockLocalDataSource mockLocalDataSource;

  setUp(() {
    mockLoginDataSource = MockLoginDataSource();
    mockLocalDataSource = MockLocalDataSource();
    repository = LoginRepositoryImpl(
      loginDataSource: mockLoginDataSource,
      localDataSource: mockLocalDataSource,
    );
  });

  group('login', () {
    const username = 'test_user';
    const password = 'test_password';
    final userModel = UserModel(token: 'test_token');
    final user = User(token: userModel.token);
    test('should login successfully and return a User object', () async {
      // Arrange
      final userModel = UserModel(token: 'test_token');
      when(mockLoginDataSource.login(any, any)).thenAnswer((_) async => userModel);
      when(mockLocalDataSource.saveToken(any)).thenAnswer((_) async {});

      // Act
      await repository.login(username, password);

      // Assert
      verify(mockLoginDataSource.login(username, password));
      verify(mockLocalDataSource.saveToken(userModel.token));
    });

    test('should login fail and return a ServerFailure', () async {
      // Arrange
      final failure = ServerFailure('Login failed');
      when(mockLoginDataSource.login('', '')).thenThrow(failure);

      // Act
      await repository.login(username, password);

      // Assert
      verify(mockLoginDataSource.login(username, password));
      verifyZeroInteractions(mockLocalDataSource);
    });
  });




}
