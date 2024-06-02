import 'package:chat_demo/features/login/data/model/user/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserModel', () {
    final tUserModel = UserModel(token: 'testToken');

    test('should be a valid model', () {
      expect(tUserModel, isA<UserModel>());
    });

    test('fromJson should return a valid model', () {
      final Map<String, dynamic> jsonMap = {
        'token': 'testToken',
      };

      final result = UserModel.fromJson(jsonMap);

      expect(result, tUserModel);
    });

    test('toJson should return a JSON map containing the proper data', () {
      final result = tUserModel.toJson();

      final expectedJsonMap = {
        'token': 'testToken',
      };

      expect(result, expectedJsonMap);
    });
  });
}
