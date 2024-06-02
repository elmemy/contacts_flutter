import 'package:chat_demo/features/contacts/data/data_sources/contacts_data_source.dart';
import 'package:chat_demo/features/contacts/data/models/contact/contact_model.dart';
import 'package:chat_demo/features/contacts/data/repositories/contact_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'contact_repository_impl_test.mocks.dart';

@GenerateMocks([ContactsDataSource])
void main() {
  late ContactRepositoryImpl repository;
  late MockContactsDataSource mockContactsDataSource;

  setUp(() {
    mockContactsDataSource = MockContactsDataSource();
    repository = ContactRepositoryImpl( mockContactsDataSource);

  });
  group('getContacts', () {
    const token = 'test_token';
    final contactModel = ContactModel(id: 1, name: 'ahmed', email: 'ahmed@example.com');
    final contactEntity = contactModel.toEntity();

    test('should return a list of contacts when the call to remote data source is successful', () async {
      // Arrange
      when(mockContactsDataSource.getContacts(any)).thenAnswer((_) async => [contactModel]);

      // Act
      await repository.getContacts(token);

      // Assert
      verify(mockContactsDataSource.getContacts(token)).called(1);
    });

    test('should return a ServerFailure when the call to remote data source fails', () async {
      // Arrange
      when(mockContactsDataSource.getContacts(any)).thenThrow(Exception('Network error'));

      // Act
      await repository.getContacts(token);

      // Assert
      verify(mockContactsDataSource.getContacts(token)).called(1);
    });
  });
}

