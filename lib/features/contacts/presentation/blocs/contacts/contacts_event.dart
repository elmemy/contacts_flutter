import 'package:equatable/equatable.dart';

abstract class ContactsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetContactsEvent extends ContactsEvent {
  final String token;

  GetContactsEvent(this.token);

  @override
  List<Object> get props => [token];
}
