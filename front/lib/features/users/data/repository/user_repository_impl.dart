
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:front/core/utils/data_state.dart';
import 'package:front/features/users/data/datasource/remote/auth_user_api_service.dart';
import 'package:front/features/users/data/model/user_model.dart';
import 'package:front/features/users/domain/entity/user.dart';
import 'package:front/features/users/domain/repository/user_repository.dart';
import 'package:front/features/users/presentation/state/auth_model.dart';

class UserRepositoryImpl implements UserRepository{
  final UserRepository _userRepository;

  UserRepositoryImpl(this._userRepository); 
  
  @override
  Future<DataState<User>> connexion(List<String> usr) {
    // TODO: implement connexion
    throw UnimplementedError();
  }
  
  @override
  Future<DataState<List>> getFavoriteProducts() {
    // TODO: implement getFavoriteProducts
    throw UnimplementedError();
  }
  
  @override
  Future<DataState<User>> inscription(List<String> usr) {
    // TODO: implement inscription
    throw UnimplementedError();
  }
  
  @override
  void removeUser(User usr) {
    // TODO: implement removeUser
  }
  
  @override
  Future<DataState<User>> updateUser(User usr) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
  

}