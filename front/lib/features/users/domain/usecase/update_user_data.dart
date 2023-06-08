import 'package:front/core/usecase.dart';
import 'package:front/core/utils/data_state.dart';
import 'package:front/features/users/domain/entity/user.dart';
import 'package:front/features/users/domain/repository/user_repository.dart';

/// Input : The user that want to update his data
/// Return : The user with his data updated
/// Role : Update the data of the uset in Input
class UpdateUser implements UseCase<Future<DataState<User>>, User> {
  final UserRepository _userRepository;

  UpdateUser(this._userRepository);

  @override
  Future<Future<DataState<User>>> call({User? params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}