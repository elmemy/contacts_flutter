import 'package:bloc/bloc.dart';
import 'login_event.dart';
import 'login_state.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login_usecase.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<getLoginEvent>(_onLoginEvent);
  }

  void _onLoginEvent(getLoginEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final Either<Failure, User> result = await loginUseCase(LoginParams(username: event.email, password: event.password));

    result.fold(
            (failure) => emit(LoginFailure(_mapFailureToMessage(failure))),
            (user) => emit(LoginSuccess(user))
    );
  }

  String _mapFailureToMessage(Failure failure) {
    // Map the failure to a user-friendly message
    if (failure is ServerFailure) {
      return failure.message;
    } else {
      return 'Unexpected error';
    }
  }
}
