import 'dart:async';

import 'package:front/core/usecase.dart';
import 'package:front/core/utils/data_state.dart';
import 'package:front/features/users/domain/entity/user.dart';
import 'package:front/features/users/domain/repository/user_loacal_repository.dart';
import 'package:front/features/users/domain/repository/user_repository.dart';

/// Input : list of new user data {"email","password","userName","isAdmin"} that whant to ceate an account
/// Return : a process succeed with the data of the user either a process error with error data
/// Role : create a new user account
class CreateUser implements UseCase<DataState, List<String>> {
  final UserRepository _userRepository;
  final UserLocalRepository _userLocalRepository;

  CreateUser(this._userRepository, this._userLocalRepository);

  @override
  Future<DataState> call({List<String>? params}) async {
    DataState result;
    if (params != null) {
      result = await _userRepository.inscription(params);
      if (result.runtimeType == DataSuccess) {
        _userLocalRepository.addUser(result.data);
        return Future.value(
            DataSuccess(result.data) as FutureOr<DataState<User>>?);
      } else if (result.runtimeType == DataFailed) {
        return Future.value(
            DataFailed(result.errorMessage));
      }
    }
    List<dynamic> nullParams = ["params argument is null"];
    return Future.value(DataFailed(nullParams));
  }
}
