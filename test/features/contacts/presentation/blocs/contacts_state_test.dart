import 'package:chat_demo/features/contacts/domain/entities/contact.dart';
import 'package:chat_demo/features/contacts/presentation/blocs/contacts/contacts_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ContactsState', () {
    group('ContactsInitial', () {
      test('supports value comparison', () {
        expect(ContactsInitial(), ContactsInitial());
      });
    });

    group('ContactsLoading', () {
      test('supports value comparison', () {
        expect(ContactsLoading(), ContactsLoading());
      });
    });

    group('ContactsLoaded', () {
      final contacts = [Contact(id: 1, name: 'Ahmed Elmemy', email: 'ahmedelmemy@example.com')];

      test('props are [contacts]', () {
        expect(ContactsLoaded(contacts).props, [contacts]);
      });

      test('supports value comparison', () {
        expect(ContactsLoaded(contacts), ContactsLoaded(contacts));
      });
    });

    group('ContactsFailure', () {
      const message = 'Error loading contacts';

      test('props are [message]', () {
        expect(ContactsFailure(message).props, [message]);
      });

      test('supports value comparison', () {
        expect(ContactsFailure(message), ContactsFailure(message));
      });
    });
  });
}
