import 'package:front/core/usecase.dart';
import 'package:front/core/utils/data_state.dart';
import 'package:front/features/users/domain/entity/user.dart';
import 'package:front/features/users/domain/repository/user_repository.dart';

/// Input : the user that want to remove his account
/// Role : remove the user account and delete his data
class RemoveUser implements UseCase<void, User> {
  final UserRepository _userRepository;

  RemoveUser(this._userRepository);
  
  @override
  Future<void> call({User? params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
  

}
