import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class LocalDataSource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
}

class LocalDataSourceImpl implements LocalDataSource {
  final FlutterSecureStorage _secureStorage;

  LocalDataSourceImpl(this._secureStorage);

  @override
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: 'token', value: token);
  }

  @override
  Future<String?> getToken() async {
    // await _secureStorage.deleteAll();
    final token = await _secureStorage.read(key: 'token');
    return token;
  }
}
