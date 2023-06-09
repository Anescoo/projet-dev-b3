import 'package:front/core/usecase.dart';
import 'package:front/core/utils/data_state.dart';
import 'package:front/features/users/domain/repository/user_repository.dart';

/// Return : List of the product
/// Role : get the list of the favorite product of a user
class GetFavoriteProducts implements UseCase<Future<DataState<List>>, void> {
  final UserRepository _userRepository;
  GetFavoriteProducts(this._userRepository);

  @override
  Future<Future<DataState<List>>> call({void params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
