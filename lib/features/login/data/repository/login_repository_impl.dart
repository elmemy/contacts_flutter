import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../shared/data/data_source/local_data_source.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositiories/login_repository.dart';
import '../data_source/login_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource loginDataSource;
  final LocalDataSource localDataSource;

  LoginRepositoryImpl({
    required this.loginDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, User>> login(String username, String password) async {
    try {
      final userModel = await loginDataSource.login(username, password);
      await localDataSource.saveToken(userModel.token);
      final user = User(token: userModel.token);
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
