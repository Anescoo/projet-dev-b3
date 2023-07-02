import 'package:front/core/usecase.dart';
import 'package:front/core/utils/data_state.dart';

/// Return : List of the product
/// Role : get the list of the favorite product of a user
class GetFavoriteProducts implements UseCase<Future<DataState<List>>, void> {
  GetFavoriteProducts();

  @override
  Future<Future<DataState<List>>> call({void params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
