import 'package:chat_demo/features/contacts/data/data_sources/contacts_data_source.dart';
import 'package:chat_demo/features/contacts/data/models/contact/contact_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:chat_demo/core/network/api_client.dart';
import 'package:chat_demo/core/error/exceptions.dart';

import 'package:mockito/annotations.dart';

import 'contacts_data_source_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late ContactsDataSourceImpl contactsDataSource;
  late MockApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockApiClient();
    contactsDataSource = ContactsDataSourceImpl(mockApiClient);
  });



  group('getContacts', () {
    const token = 'test_token';
    final contactModels = [
      ContactModel(id: 1, name: 'Ahmed Elmemy', email: 'ahmed.elmemy@example.com')
    ];

    test('should return a list of ContactModel when the response code is 200 (success)', () async {
      // Arrange
      when(mockApiClient.get(any, headers: anyNamed('headers'))).thenAnswer(
            (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          data: [
            {'id': 1, 'name': 'Ahmed Elmemy', 'email': 'ahmed.elmemy@example.com'}
          ],
          statusCode: 200,
        ),
      );

      // Act
      final result = await contactsDataSource.getContacts(token);

      // Assert
      expect(result, equals(contactModels));
    });

    test('should throw ServerException when the response code is not 200', () async {
      // Arrange
      when(mockApiClient.get(any, headers: anyNamed('headers'))).thenAnswer(
            (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 404,
        ),
      );

      // Act
      final call = contactsDataSource.getContacts;

      // Assert
      expect(() => call(token), throwsA(isA<ServerException>()));
    });
  });
}
