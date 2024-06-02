import '../../../../core/error/failures.dart';
import '../data_sources/contacts_data_source.dart';
import '../../domain/repositories/contact_repository.dart';
import '../../domain/entities/contact.dart';
import 'package:dartz/dartz.dart';

class ContactRepositoryImpl implements ContactRepository {
  final ContactsDataSource contactsDataSource;

  ContactRepositoryImpl(this.contactsDataSource);

  @override
  Future<Either<Failure, List<Contact>>> getContacts(String token) async {
    try {
      final contactModels = await contactsDataSource.getContacts(token);
      final contacts = contactModels.map((model) => model.toEntity()).toList();
      return Right(contacts);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
