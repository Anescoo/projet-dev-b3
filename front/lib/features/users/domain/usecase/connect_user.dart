import 'dart:async';

import 'package:front/core/usecase.dart';
import 'package:front/core/utils/data_state.dart';
import 'package:front/features/users/data/datasource/remote/auth_user_api_service.dart';
import 'package:front/features/users/data/model/user_model.dart';
import 'package:front/features/users/domain/entity/user.dart';
import 'package:front/features/users/domain/repository/user_local_repository.dart';
import 'package:front/features/users/domain/repository/user_repository.dart';

/// Input : list of us user data {"email","pwd"}
/// Return : a process succeed with the data of the user either a process error with error data
/// Role : connect a user to his account
class ConnectUser implements UseCase<DataState, List<String>> {
  final UserRepository _userRepository;
  final UserLocalRepository _userLocalRepository;

  ConnectUser(this._userRepository, this._userLocalRepository);

  @override
  Future<DataState> call({List<String>? params}) async {
    DataState result;
    if (params != null) {
      result = await _userRepository.connexion(params);
      if (result.runtimeType == DataSuccess<User>) {
        User resUsr = result.data;
        _userLocalRepository.addUser(resUsr);
        return DataSuccess<User>(resUsr);
      } else if (result.runtimeType == DataFailed) {
        return  DataFailed(result.errorMessage);
      }
    }
    List<dynamic> nullParams = ["params argument is null"];
    return DataFailed(nullParams);
  }
}
