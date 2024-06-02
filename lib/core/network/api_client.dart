import 'package:dio/dio.dart';

import '../error/exceptions.dart';
import 'network_info.dart';

class ApiClient {
  final Dio dio;
  final NetworkInfo networkInfo;

  ApiClient(this.dio, this.networkInfo) {
    dio.options.baseUrl = 'https://mobile-dev-assignment.fly.dev/';
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  Future<Response> get(String path, {Map<String, dynamic>? headers}) async {
    print(headers);
    if (await networkInfo.isConnected) {
      try {
        return await dio.get(path, options: Options(headers: headers));
      } catch (e) {
        throw ServerException(e.toString());
      }
    } else {
      throw CacheException("No Internet Connection");
    }
  }




  Future<Response> post(String path, {dynamic data, Map<String, dynamic>? headers}) async {
    if (await networkInfo.isConnected) {
      try {
        return await dio.post(path, data: data, options: Options(headers: headers));
      } catch (e) {
        throw ServerException(e.toString());
      }
    } else {
      throw CacheException('No Internet Connection');
    }
  }
}
