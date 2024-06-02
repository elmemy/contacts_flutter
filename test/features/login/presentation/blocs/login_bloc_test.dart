import 'package:bloc_test/bloc_test.dart';
import 'package:chat_demo/core/error/failures.dart';
import 'package:chat_demo/features/login/domain/entities/user.dart';
import 'package:chat_demo/features/login/domain/usecases/login_usecase.dart';
import 'package:chat_demo/features/login/presentation/blocs/login_event.dart';
import 'package:chat_demo/features/login/presentation/blocs/login_state.dart';
import 'package:chat_demo/features/login/presentation/blocs/login_bloc.dart';

import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'login_bloc_test.mocks.dart';


@GenerateMocks([LoginUseCase])
void main() {
  late LoginBloc loginBloc;
  late MockLoginUseCase mockLoginUseCase;

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    loginBloc = LoginBloc(mockLoginUseCase);
  });

  group('LoginBloc', () {
    const username = 'test_user';
    const password = 'test_password';
    final user = User(token: 'test_token');

    blocTest<LoginBloc, LoginState>(
      'emits [LoginLoading, LoginSuccess] when login is successful',
      build: () {
        when(mockLoginUseCase(any)).thenAnswer((_) async => Right(user));
        return loginBloc;
      },
      act: (bloc) => bloc.add(const getLoginEvent(username, password)),
      expect: () => [
        LoginLoading(),
        LoginSuccess(user),
      ],
      verify: (_) {
        verify(mockLoginUseCase(LoginParams(username: username, password: password)));
      },
    );

    blocTest<LoginBloc, LoginState>(
      'emits [LoginLoading, LoginFailure] when login fails',
      build: () {
        when(mockLoginUseCase(any)).thenAnswer((_) async => Left(ServerFailure('Server error')));
        return loginBloc;
      },
      act: (bloc) => bloc.add(const getLoginEvent(username, password)),
      expect: () => [
        LoginLoading(),
        LoginFailure('Server error'),
      ],
      verify: (_) {
        verify(mockLoginUseCase(LoginParams(username: username, password: password)));
      },
    );
  });
}
