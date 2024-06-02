import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/contact.dart';

part 'contact_model.g.dart';

@JsonSerializable()
class ContactModel {
  final int id;
  final String name;
  final String email;

  ContactModel({required this.id, required this.name, required this.email});

  factory ContactModel.fromJson(Map<String, dynamic> json) => _$ContactModelFromJson(json);
  Map<String, dynamic> toJson() => _$ContactModelToJson(this);

  Contact toEntity() {
    return Contact(id: id, name: name, email: email);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ContactModel &&
        other.id == id &&
        other.name == name &&
        other.email == email;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ email.hashCode;
}
