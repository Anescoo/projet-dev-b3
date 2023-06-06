import 'package:front/core/usecase.dart';
import 'package:front/core/utils/data_state.dart';
import 'package:front/features/users/domain/entity/user.dart';
import 'package:front/features/users/domain/repository/user_repository.dart';

/// Input : list of new user data {"email","password","userName","isAdmin"} that whant to ceate an account
/// Return : a process succeed with the data of the user either a process error with error data
/// Role : create a new user account
class CreateUser implements UseCase<DataState<User>, List<String>> {
  final UserRepository _userRepository;

  CreateUser(this._userRepository);
  
  @override
  Future<DataState<User>> call({List<String>? params}) {
    // TODO: implement call
    throw UnimplementedError();
  }


}
