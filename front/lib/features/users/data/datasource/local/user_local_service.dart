import 'package:front/core/collections/user_collection.dart';
import 'package:front/core/isar_service.dart';
import 'package:front/features/users/domain/entity/user.dart';
import 'package:isar/isar.dart';

class UserLocalService {
  IsarService isar;
  UserLocalService(this.isar);

  void addUser(User usr) async {
    var instance = await isar.db;

    final newUser = UserCollection()
      ..usrname = usr.usrname
      ..id = usr.id
      ..token = usr.token
      ..email = usr.email
      ..password = usr.password
      ..isAdmin = usr.isAdmin;

    await instance.writeTxn(() async {
      await instance.userCollections.put(newUser); // Insertion & modification
    });
  }

  Future<String> getToken() async {
    var instance = await isar.db;
    var userCollection = instance.userCollections;

    var user = await userCollection.filter().tokenIsNotEmpty().findFirst();

    return user?.token ?? '';
  }

  void deleteUser() async {
    var instance = await isar.db;
    var userCollection = instance.userCollections;

    await instance.writeTxn(() async {
      var user = await userCollection.filter().tokenIsNotEmpty().findFirst();
      if (user != null) {
        await userCollection.delete(user.isarId);
      }
    });
  }

  List getFavoriteProducts() {
    throw UnimplementedError();
  }
}
