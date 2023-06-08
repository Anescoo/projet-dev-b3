import 'dart:async';

import 'package:front/core/usecase.dart';
import 'package:front/core/utils/data_state.dart';
import 'package:front/features/users/data/datasource/remote/auth_user_api_service.dart';
import 'package:front/features/users/domain/entity/user.dart';
import 'package:front/features/users/domain/repository/user_loacal_repository.dart';
import 'package:front/features/users/domain/repository/user_repository.dart';

/// Input : list of us user data {"email","pwd"}
/// Return : a process succeed with the data of the user either a process error with error data
/// Role : connect a user to his account
class ConnectUser implements UseCase<DataState<User>, List<String>> {
  final UserRepository _userRepository;
  final UserLocalRepository _userLocalRepository;

  ConnectUser(this._userRepository, this._userLocalRepository);

  @override
  Future<DataState<User>> call({List<String>? params}) async {
    DataState result;
    if (params != null) {
      result = await _userRepository.connexion(params);
      if (result.runtimeType == DataSuccess) {
        _userLocalRepository.addUser(result.data);
        return Future.value(
            DataSuccess(result.data) as FutureOr<DataState<User>>?);
      } else if (result.runtimeType == DataFailed) {
        return Future.value(
            DataFailed(result.errorMessage) as FutureOr<DataState<User>>?);
      }
    }
    List<dynamic> nullParams = ["params argument is null"];
    return Future.value(DataFailed(nullParams) as FutureOr<DataState<User>>?);
  }
}
