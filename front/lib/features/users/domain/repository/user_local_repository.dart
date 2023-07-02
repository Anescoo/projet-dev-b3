
import 'package:front/core/collections/user_collection.dart';
import 'package:front/features/users/domain/entity/user.dart';

abstract class UserLocalRepository {

  void addUser(User usr);

  Future<UserCollection?> getUser();

  Future<String> getToken();

  void deleteUser();
  
  List getFavoriteProducts();
}