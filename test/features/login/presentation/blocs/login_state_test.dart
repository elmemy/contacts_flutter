import 'package:chat_demo/features/login/domain/entities/user.dart';
import 'package:chat_demo/features/login/presentation/blocs/login_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginState', () {
    group('LoginInitial', () {
      test('supports value comparison', () {
        expect(LoginInitial(), LoginInitial());
      });
    });

    group('LoginLoading', () {
      test('supports value comparison', () {
        expect(LoginLoading(), LoginLoading());
      });
    });

    group('LoginSuccess', () {
      final user = User(token: 'test_token');

      test('props are [user]', () {
        expect(LoginSuccess(user).props, [user]);
      });

      test('supports value comparison', () {
        expect(LoginSuccess(user), LoginSuccess(user));
      });
    });

    group('LoginFailure', () {
      const message = 'Login failed';

      test('props are [message]', () {
        expect(LoginFailure(message).props, [message]);
      });

      test('supports value comparison', () {
        expect(LoginFailure(message), LoginFailure(message));
      });
    });
  });
}
