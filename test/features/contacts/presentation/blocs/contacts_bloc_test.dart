import 'package:bloc_test/bloc_test.dart';
import 'package:chat_demo/core/error/failures.dart';
import 'package:chat_demo/features/contacts/domain/entities/contact.dart';
import 'package:chat_demo/features/contacts/domain/repositories/contact_repository.dart';
import 'package:chat_demo/features/contacts/presentation/blocs/contacts/contacts_bloc.dart';
import 'package:chat_demo/features/contacts/presentation/blocs/contacts/contacts_event.dart';
import 'package:chat_demo/features/contacts/presentation/blocs/contacts/contacts_state.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:dartz/dartz.dart';

import 'contacts_bloc_test.mocks.dart';

@GenerateMocks([ContactRepository])
void main() {
  late ContactsBloc contactsBloc;
  late MockContactRepository mockContactRepository;

  setUp(() {
    mockContactRepository = MockContactRepository();
    contactsBloc = ContactsBloc(mockContactRepository);
  });

  group('ContactsBloc', () {
    const token = 'test_token';
    final contacts = [
      Contact(id: 1, name: 'ahmed elmemy', email: 'ahmed.elmemy@example.com')
    ];

    blocTest<ContactsBloc, ContactsState>(
      'emits [ContactsLoading, ContactsLoaded] when GetContactsEvent is added and the repository call is successful',
      build: () {
        when(mockContactRepository.getContacts(any)).thenAnswer((_) async => Right(contacts));
        return contactsBloc;
      },
      act: (bloc) => bloc.add(GetContactsEvent(token)),
      expect: () => [
        ContactsLoading(),
        ContactsLoaded(contacts),
      ],
      verify: (_) {
        verify(mockContactRepository.getContacts(token));
      },
    );

    blocTest<ContactsBloc, ContactsState>(
      'emits [ContactsLoading, ContactsFailure] when GetContactsEvent is added and the repository call fails',
      build: () {
        when(mockContactRepository.getContacts(any)).thenAnswer((_) async => Left(ServerFailure('Server error')));
        return contactsBloc;
      },
      act: (bloc) => bloc.add(GetContactsEvent(token)),
      expect: () => [
        ContactsLoading(),
        ContactsFailure('Server error'),
      ],
      verify: (_) {
        verify(mockContactRepository.getContacts(token));
      },
    );
  });
}
