import 'package:dio/dio.dart';
import 'package:front/core/app_state.dart';
import 'package:front/core/isar_service.dart';
import 'package:front/features/content/data/datasource/local/product_local_service.dart';
import 'package:front/features/content/data/datasource/remote/product_api_service.dart';
import 'package:front/features/content/domain/usecase/get_products.dart';
import 'package:front/features/users/data/datasource/local/user_local_service.dart';
import 'package:front/features/users/data/datasource/remote/auth_user_api_service.dart';
import 'package:front/features/users/data/repository/user_repository_impl.dart';
import 'package:front/features/users/domain/repository/user_local_repository.dart';
import 'package:front/features/users/domain/repository/user_repository.dart';
import 'package:front/features/users/domain/usecase/connect_user.dart';
import 'package:front/features/users/domain/usecase/create_user.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  ///* External dependencies
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<IsarService>(IsarService());

  ///* services
  getIt.registerSingleton<UserApiService>(UserApiService(getIt()));
  getIt.registerSingleton<UserLocalService>(UserLocalService(getIt()));
  getIt.registerSingleton<ProductApiService>(ProductApiService(getIt()));
  getIt.registerSingleton<ProductLocalService>(ProductLocalService(getIt()));

  ///* repositories
  getIt.registerSingleton<UserRepository>(UserRepositoryImpl(getIt(), getIt()));
  getIt.registerSingleton<UserLocalRepository>(UserLocalService(getIt()));

  ///* usecases
  getIt.registerSingleton<ConnectUser>(ConnectUser(getIt(), getIt()));
  getIt.registerSingleton<CreateUser>(CreateUser(getIt(),getIt()));
  // getIt.registerSingleton<GetAllProduct>(GetAllProduct(getIt()));

  ///* State
  getIt.registerFactory(() => AppState());
}
