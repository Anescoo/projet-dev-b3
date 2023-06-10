import 'package:dio/dio.dart';
import 'package:front/core/app_state.dart';
import 'package:front/core/isar_service.dart';
import 'package:front/features/users/data/datasource/local/user_local_service.dart';
import 'package:front/features/users/data/datasource/remote/auth_user_api_service.dart';
import 'package:front/features/users/data/repository/user_repository_impl.dart';
import 'package:front/features/users/domain/repository/user_repository.dart';
import 'package:front/features/users/domain/usecase/connect_user.dart';
import 'package:get_it/get_it.dart';

final s1 = GetIt.instance;

Future<void> initializeDependencies() async {
  ///* External dependencies
  s1.registerSingleton<Dio>(Dio());
  s1.registerSingleton<IsarService>(IsarService());


  ///* services
  s1.registerSingleton<UserApiService>(UserApiService(s1()));
  s1.registerSingleton<UserLocalService>(UserLocalService(s1()));

  ///* repositories
  s1.registerSingleton<UserRepository>(UserRepositoryImpl(s1(), s1()));
  
  ///* usecases
  s1.registerSingleton(ConnectUser(s1(), s1()));

  ///* State
  s1.registerFactory(() => AppState());
}
