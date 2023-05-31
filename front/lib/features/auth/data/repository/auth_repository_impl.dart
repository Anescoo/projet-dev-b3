
import 'package:dio/dio.dart';
import 'package:front/core/utils/data_state.dart';
import 'package:front/features/auth/data/datasource/remote/auth_user_api_service.dart';
import 'package:front/features/auth/data/model/user.dart';
import 'package:front/features/auth/domain/entity/user.dart';
import 'package:front/features/auth/domain/repository/auth_repository.dart';
import 'package:front/features/auth/presentation/state/auth_model.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthUserApiService _authUserApiService;

  AuthRepositoryImpl(this._authUserApiService);
  
  @override
  void addTokenToHive() {
    // TODO: implement addTokenToHive
  }

  @override
  Future<User> connexion(UserModel usr) async {
    //! todo: handle errors
    var res = await _authUserApiService.login(usr);
        print(res.toString());
    return res;
  }

  @override
  void getTokenFromHive() {
    // TODO: implement getTokenFromHive
  }

  @override
  Future<DataState<User>> inscription() {
    // TODO: implement inscription
    throw UnimplementedError();
  }

  
}