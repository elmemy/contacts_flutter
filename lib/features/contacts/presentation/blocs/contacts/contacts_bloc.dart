import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/contact_repository.dart';
import 'contacts_event.dart';
import 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final ContactRepository contactRepository;

  ContactsBloc(this.contactRepository) : super(ContactsInitial()) {
    on<GetContactsEvent>(_onGetContactsEvent);
  }

  Future<void> _onGetContactsEvent(GetContactsEvent event, Emitter<ContactsState> emit) async {
    emit(ContactsLoading());
    final failureOrContacts = await contactRepository.getContacts(event.token);
    failureOrContacts.fold(
          (failure) => emit(ContactsFailure(failure.message)),
          (contacts) => emit(ContactsLoaded(contacts)),
    );
  }
}
