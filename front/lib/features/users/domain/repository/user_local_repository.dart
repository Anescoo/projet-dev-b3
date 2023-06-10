
import 'package:front/features/users/domain/entity/user.dart';

abstract class UserLocalRepository {

  void addUser(User usr);

  Future<String> getToken();

  void deleteUser();
  
  List getFavoriteProducts();
}