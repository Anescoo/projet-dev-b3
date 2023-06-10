import 'package:front/core/usecase.dart';
import 'package:front/features/users/domain/entity/user.dart';
import 'package:front/features/users/domain/repository/user_local_repository.dart';
import 'package:front/features/users/domain/repository/user_repository.dart';

/// Input : the user that want to remove his account
/// Role : remove the user account and delete his data
class RemoveUser implements UseCase<void, User> {
  final UserRepository _userRepository;
  final UserLocalRepository _userLocalRepository;

  RemoveUser(this._userRepository, this._userLocalRepository);

  @override
  Future<void> call({User? params}) async{
  //   if (params != null) {
  //     resul= await _userRepository.connexion(params);
  //     if (result.runtimeType == DataSuccess) {
  //       _userLocalRepository.addUser(result.data);
  //       return Future.value(
  //           DataSuccess(result.data) as FutureOr<DataState<User>>?);
  //     } else if (result.runtimeType == DataFailed) {
  //       return Future.value(
  //           DataFailed(result.errorMessage) as FutureOr<DataState<User>>?);
  //     }
  //   }
  //   List<dynamic> nullParams = ["params argument is null"];
  //   return Future.value(DataFailed(nullParams) as FutureOr<DataState<User>>?);
  // }
    throw UnimplementedError();
  }
}
