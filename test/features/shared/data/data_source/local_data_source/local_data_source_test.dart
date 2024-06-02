import 'package:chat_demo/features/shared/data/data_source/local_data_source.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'local_data_source_test.mocks.dart';

@GenerateMocks([FlutterSecureStorage])
void main() {
  late LocalDataSourceImpl dataSource;
  late MockFlutterSecureStorage mockFlutterSecureStorage;

  setUp(() {
    mockFlutterSecureStorage = MockFlutterSecureStorage();
    dataSource = LocalDataSourceImpl(mockFlutterSecureStorage);
  });

  group('saveToken', () {
    const token = 'test_token';

    test('should call FlutterSecureStorage to save the token', () async {
      // arrange
      when(mockFlutterSecureStorage.write(key: 'token', value: token))
          .thenAnswer((_) async => Future.value());

      // act
      await dataSource.saveToken(token);

      // assert
      verify(mockFlutterSecureStorage.write(key: 'token', value: token));
    });
  });

  group('getToken', () {
    const token = 'test_token';

    test('should return token from FlutterSecureStorage', () async {
      // arrange
      when(mockFlutterSecureStorage.read(key: 'token'))
          .thenAnswer((_) async => token);

      // act
      final result = await dataSource.getToken();

      // assert
      verify(mockFlutterSecureStorage.read(key: 'token'));
      expect(result, token);
    });

    test('should return null when there is no token in FlutterSecureStorage', () async {
      // arrange
      when(mockFlutterSecureStorage.read(key: 'token'))
          .thenAnswer((_) async => null);

      // act
      final result = await dataSource.getToken();

      // assert
      verify(mockFlutterSecureStorage.read(key: 'token'));
      expect(result, null);
    });
  });
}
