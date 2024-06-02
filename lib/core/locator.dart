import 'package:get_it/get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../features/contacts/data/data_sources/contacts_data_source.dart';
import '../features/contacts/data/repositories/contact_repository_impl.dart';
import '../features/contacts/domain/repositories/contact_repository.dart';
import '../features/contacts/domain/usecases/get_contacts_usecase.dart';
import '../features/contacts/presentation/blocs/contacts/contacts_bloc.dart';
import '../features/login/data/data_source/login_data_source.dart';
import '../features/login/data/repository/login_repository_impl.dart';
import '../features/login/domain/repositiories/login_repository.dart';
import '../features/login/domain/usecases/login_usecase.dart';
import '../features/login/presentation/blocs/login_bloc.dart';
import '../features/shared/data/data_source/local_data_source.dart';
import 'network/network_info.dart';
import 'network/api_client.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Register SharedPreferences instance
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  // Register FlutterSecureStorage instance
  sl.registerLazySingleton(() => FlutterSecureStorage());
  // Register Connectivity instance
  sl.registerLazySingleton(() => Connectivity());
  // Register NetworkInfo instance
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  // Register Dio instance
  sl.registerLazySingleton(() => Dio());
  // Register API client
  sl.registerLazySingleton<ApiClient>(() => ApiClient(sl(), sl()));
  // Register data sources
  sl.registerLazySingleton<ContactsDataSource>(() => ContactsDataSourceImpl(sl()));
  sl.registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl(sl()));
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(sl<FlutterSecureStorage>()));
  // Register repositories
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(loginDataSource: sl(), localDataSource: sl(),),);
  sl.registerLazySingleton<ContactRepository>(() => ContactRepositoryImpl(sl()));
  // Register use cases
  sl.registerLazySingleton(() => GetContactsUseCase(sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  // Register blocs
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => ContactsBloc(sl()));
}
