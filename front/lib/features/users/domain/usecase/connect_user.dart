import 'dart:ffi';

import 'package:front/core/usecase.dart';
import 'package:front/core/utils/data_state.dart';
import 'package:front/features/users/domain/entity/user.dart';
import 'package:front/features/users/domain/repository/user_repository.dart';

/// Input : list of us user data {"email","pwd"}
/// Return : a process succeed with the data of the user either a process error with error data
/// Role : connect a user to his account
class ConnectUser implements UseCase<DataState<User>, List<String>> {
  final UserRepository _userRepository;

  ConnectUser(this._userRepository);
  
  @override
  Future<DataState<User>> call({List? params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
  


}
