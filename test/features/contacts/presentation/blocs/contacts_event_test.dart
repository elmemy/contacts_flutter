import 'package:chat_demo/features/contacts/presentation/blocs/contacts/contacts_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ContactsEvent', () {
    test('GetContactsEvent props are [token]', () {
      // Arrange
      final token = 'test_token';

      // Act
      final event = GetContactsEvent(token);

      // Assert
      expect(event.props, [token]);
    });

    test('GetContactsEvent equality', () {
      // Arrange
      final token = 'test_token';

      // Act
      final event1 = GetContactsEvent(token);
      final event2 = GetContactsEvent(token);

      // Assert
      expect(event1, event2);
    });

    test('GetContactsEvent inequality', () {
      // Arrange
      final token1 = 'test_token_1';
      final token2 = 'test_token_2';

      // Act
      final event1 = GetContactsEvent(token1);
      final event2 = GetContactsEvent(token2);

      // Assert
      expect(event1, isNot(event2));
    });
  });
}
