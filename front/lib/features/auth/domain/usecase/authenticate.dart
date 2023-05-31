
import 'package:front/core/usecase.dart';
import 'package:front/features/auth/data/model/user.dart';
import 'package:front/features/auth/domain/entity/user.dart';
import 'package:front/features/auth/domain/repository/auth_repository.dart';

class AuthenticateUsecase implements UseCase<User,void> {
  final AuthRepository _authRepository;

  AuthenticateUsecase(this._authRepository);
  @override
  Future<User> call({void params}) {
    const usr = UserModel(email: 'testoy@gmail.com',password: 'testoy64');
    return _authRepository.connexion(usr);
  }
  
 
}