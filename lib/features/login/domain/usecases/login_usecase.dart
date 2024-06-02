import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/base_use_cases/usecase.dart';
import '../../../../core/error/failures.dart';
import '../repositiories/login_repository.dart';
import '../entities/user.dart';

class LoginUseCase implements BaseUseCase<User, LoginParams> {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    return await repository.login(params.username, params.password);
  }
}

class LoginParams extends Equatable {
  final String username;
  final String password;

  LoginParams({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}