import 'package:front/core/usecase.dart';
import 'package:front/core/utils/data_state.dart';
import 'package:front/features/users/data/model/user_model.dart';
import 'package:front/features/users/domain/entity/user.dart';
import 'package:front/features/users/domain/repository/user_repository.dart';

class AuthenticateUsecase implements UseCase<DataState<User>, UserModel> {
  final UserRepository _userRepository;

  AuthenticateUsecase(this._userRepository);
  
  @override
  Future<DataState<User>> call({UserModel? params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
  

  
}