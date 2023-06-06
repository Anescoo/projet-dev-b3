import 'package:front/core/utils/data_state.dart';
import 'package:front/features/users/domain/entity/user.dart';

/// get data from api and local storage
abstract class UserRepository {

  Future<DataState<User>> connexion(List<String> usr);

  Future<DataState<User>> inscription(List<String> usr);

  void removeUser(User usr);

  Future<DataState<List>> getFavoriteProducts();

  Future<DataState<User>> updateUser(User usr);

}