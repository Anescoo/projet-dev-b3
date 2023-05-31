
import 'package:front/core/utils/data_state.dart';
import 'package:front/features/auth/data/model/user.dart';
import 'package:front/features/auth/domain/entity/user.dart';

/// make all the request to api for tha auth process 
abstract class AuthRepository {

  Future<User> connexion(UserModel usr);

  Future<DataState<User>> inscription();

  void addTokenToHive(){}

  void getTokenFromHive(){}



  // String getAuthToken(){}
  
}