import 'package:chat_demo/core/error/failures.dart';
import 'package:chat_demo/features/contacts/domain/entities/contact.dart';
import 'package:chat_demo/features/contacts/domain/repositories/contact_repository.dart';
import 'package:chat_demo/features/contacts/domain/usecases/get_contacts_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'get_contacts_usecase_test.mocks.dart';



@GenerateMocks([ContactRepository])
void main() {
  late GetContactsUseCase useCase;
  late MockContactRepository mockContactRepository;

  setUp(() {
    mockContactRepository = MockContactRepository();
    useCase = GetContactsUseCase(mockContactRepository);
  });

  group('GetContactsUseCase', () {
    const token = 'test_token';
    final contacts = [
      Contact(id: 1, name: 'ahmedelmemy', email: 'ahmed.elmemy@example.com')
    ];

    test('should return a list of contacts when the repository call is successful', () async {
      // Arrange
      when(mockContactRepository.getContacts(token)).thenAnswer((_) async => Right(contacts));

      // Act
      final result = await useCase(token);

      // Assert
      expect(result, Right(contacts));
      verify(mockContactRepository.getContacts(token));
      verifyNoMoreInteractions(mockContactRepository);
    });

    test('should return a ServerFailure when the repository call fails', () async {
      // Arrange
      when(mockContactRepository.getContacts(token)).thenAnswer((_) async => Left(ServerFailure('Server error')));

      // Act
      final result = await useCase(token);

      // Assert
      expect(result, Left(ServerFailure('Server error')));
      verify(mockContactRepository.getContacts(token));
      verifyNoMoreInteractions(mockContactRepository);
    });
  });
}
