import 'package:chat_demo/features/contacts/data/models/contact/contact_model.dart';
import 'package:test/test.dart';

void main() {
  group('ContactModel JSON Serialization', () {
    test('should serialize to JSON correctly', () {
      // Arrange
      final contact = ContactModel(id: 1, name: 'ahmed', email: 'ahmed.elmemy@example.com');

      // Act
      final json = contact.toJson();

      // Assert
      expect(json, isA<Map>());
      expect(json['id'], contact.id);
      expect(json['name'], contact.name);
      expect(json['email'], contact.email);
    });

    test('should deserialize from JSON correctly', () {
      // Arrange
      final json = {
        'id': 1,
        'name': 'ahmed',
        'email': 'ahmed.elmemy@example.com',
      };

      // Act
      final contact = ContactModel.fromJson(json);

      // Assert
      expect(contact, isA<ContactModel>());
      expect(contact.id, json['id']);
      expect(contact.name, json['name']);
      expect(contact.email, json['email']);
    });
  });
}
