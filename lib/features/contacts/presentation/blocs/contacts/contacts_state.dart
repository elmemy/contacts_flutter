import 'package:equatable/equatable.dart';
import '../../../domain/entities/contact.dart';
abstract class ContactsState extends Equatable {
  @override
  List<Object> get props => [];
}

class ContactsInitial extends ContactsState {}

class ContactsLoading extends ContactsState {}

class ContactsLoaded extends ContactsState {
  final List<Contact> contacts;

  ContactsLoaded(this.contacts);

  @override
  List<Object> get props => [contacts];
}

class ContactsFailure extends ContactsState {
  final String message;

  ContactsFailure(this.message);

  @override
  List<Object> get props => [message];
}
