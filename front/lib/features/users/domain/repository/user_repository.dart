import 'package:front/core/utils/data_state.dart';
import 'package:front/features/users/domain/entity/user.dart';

/// get data from api and local storage
abstract class UserRepository {

  Future<DataState> connexion(List<String> usr);

  Future<DataState> inscription(List<String> usr,bool isAdmin);

  void removeUser(User usr);

  Future<DataState<List>> getFavoriteProducts();

  Future<DataState> updateUser(User usr);

}