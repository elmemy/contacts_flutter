import 'package:chat_demo/features/login/data/data_source/login_data_source.dart';
import 'package:chat_demo/features/login/data/model/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:chat_demo/core/network/api_client.dart';
import 'package:chat_demo/core/error/exceptions.dart';

import 'package:mockito/annotations.dart';

import 'login_data_source_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late LoginDataSourceImpl loginDataSource;
  late MockApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockApiClient();
    loginDataSource = LoginDataSourceImpl(mockApiClient);
  });

  group('login', () {
    const username = 'test_user';
    const password = 'test_password';
    final userModel = UserModel(token: 'test_token');

    test('should return UserModel when the response code is 200 (success)', () async {
      // Arrange
      when(mockApiClient.post(any, data: anyNamed('data'))).thenAnswer(
            (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          data: {'token': 'test_token'},
          statusCode: 200,
        ),
      );

      // Act
      final result = await loginDataSource.login(username, password);

      // Assert
      expect(result, equals(userModel));
    });

    test('should throw ServerException when the response code is not 200', () async {
      // Arrange
      when(mockApiClient.post(any, data: anyNamed('data'))).thenAnswer(
            (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 404,
        ),
      );

      // Act
      final call = loginDataSource.login;

      // Assert
      expect(() => call(username, password), throwsA(isA<ServerException>()));
    });
  });

}
