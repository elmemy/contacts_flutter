import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/contact.dart';
import '../repositories/contact_repository.dart';

class GetContactsUseCase {
  final ContactRepository repository;

  GetContactsUseCase(this.repository);

  Future<Either<Failure, List<Contact>>> call(String token) async {
    return await repository.getContacts(token);
  }
}
