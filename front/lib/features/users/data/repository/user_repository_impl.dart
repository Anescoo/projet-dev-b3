import 'dart:async';

import 'package:front/core/utils/data_state.dart';
import 'package:front/features/users/data/datasource/remote/auth_user_api_service.dart';
import 'package:front/features/users/data/model/user_model.dart';
import 'package:front/features/users/domain/entity/user.dart';
import 'package:front/features/users/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserApiService _userApiService;

  UserRepositoryImpl(this._userApiService);

  @override
  Future<DataState> connexion(List<String> usr) async {
    UserModel user =
        UserModel(email: usr[0], password: usr[1], id: '', token: '', isAdmin: false, usrname: '');
    UserModel res = await _userApiService.signIn(user);
    if (res.statusCode == 200) {
      User loggedUser = res; //get all the userdata
      return DataSuccess<User>(loggedUser);
    } else if (res.statusCode == 0) {
      print("cant get statuscode");
    }
    return DataFailed(res.message);
  }

  @override
  Future<DataState<List>> getFavoriteProducts() {
    // TODO: implement getFavoriteProducts
    throw UnimplementedError();
  }

  @override
  Future<DataState> inscription(List<String> usr) async {
    UserModel newUser = UserModel(
        email: usr[0],
        password: usr[1],
        usrname: usr[2],
        isAdmin: bool.fromEnvironment(usr[3]),
        id: '',
        token: '');
    UserModel res = await _userApiService.signUp(newUser);
    if (res.statusCode == 200) {
      User user = res;
      return DataSuccess<User>(user);
    } else if (res.statusCode == 0) {
      print("cant get statuscode");
    }
    return DataFailed(res.message);
  }

  @override
  void removeUser(User usr) async {
    await _userApiService.removeUser(usr.id, usr.token);
  }

  @override
  Future<DataState> updateUser(User usr) async {
    UserModel currentUser = UserModel(
        email: usr.email,
        password: usr.password,
        usrname: usr.usrname,
        isAdmin: usr.isAdmin,
        id: usr.id,
        token: usr.token);
    UserModel res =
        await _userApiService.updateUser(currentUser, currentUser.token);
    if (res.statusCode == 200) {
      User user = res;
      return Future.value(DataSuccess(user));
    } else if (res.statusCode == 0) {
      print("cant get statuscode");
    }
    return Future.value(DataFailed(res.message));
  }
}
