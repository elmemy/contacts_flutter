import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../models/contact/contact_model.dart';

abstract class ContactsDataSource {
  Future<List<ContactModel>> getContacts(String token);
}

class ContactsDataSourceImpl implements ContactsDataSource {
  final ApiClient _apiClient;
  ContactsDataSourceImpl(this._apiClient);

  ApiClient get apiClient => _apiClient;

  Future<List<ContactModel>> getContacts(String token) async {
    final response = await _apiClient.get('/contacts', headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((json) => ContactModel.fromJson(json))
          .toList();
    } else {
      throw ServerException('Failed to load contacts');
    }
  }
}
