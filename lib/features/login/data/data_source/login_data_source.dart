
import 'package:chat_demo/core/network/api_config.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../model/user/user_model.dart';

abstract class LoginDataSource {
  Future<UserModel> login(String username, String password);
}

class LoginDataSourceImpl implements LoginDataSource {
  final ApiClient _apiClient;

  LoginDataSourceImpl(this._apiClient);

  ApiClient get apiClient => _apiClient;

  @override

  Future<UserModel> login(String username, String password) async {
    final response = await _apiClient.post(ApiConfig.loginEndpoint, data: {'username': username, 'password': password});

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw ServerException('Failed to login');
    }
  }

}
