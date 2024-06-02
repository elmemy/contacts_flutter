import 'package:chat_demo/features/login/presentation/blocs/login_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('getLoginEvent', () {
    const tEmail = 'test@example.com';
    const tPassword = 'password123';

    test('props are [email, password]', () {
      // Arrange
      const event = getLoginEvent(tEmail, tPassword);

      // Assert
      expect(event.props, [tEmail, tPassword]);
    });

    test('two instances with the same values should be equal', () {
      // Arrange
      const event1 = getLoginEvent(tEmail, tPassword);
      const event2 = getLoginEvent(tEmail, tPassword);

      // Assert
      expect(event1, event2);
    });

    test('two instances with different values should not be equal', () {
      // Arrange
      const event1 = getLoginEvent(tEmail, tPassword);
      const event2 = getLoginEvent('different@example.com', 'differentPassword');

      // Assert
      expect(event1, isNot(event2));
    });
  });
}
