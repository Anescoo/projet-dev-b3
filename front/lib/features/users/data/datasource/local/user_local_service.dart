import 'package:front/core/collections/user_collection.dart';
import 'package:front/core/isar_service.dart';
import 'package:front/features/users/domain/entity/user.dart';
import 'package:front/features/users/domain/repository/user_local_repository.dart';
import 'package:isar/isar.dart';

class UserLocalService implements UserLocalRepository {
  IsarService isar;
  UserLocalService(this.isar);

  @override
  void addUser(User usr) async {
    var instance = await isar.db;

    final newUser = UserCollection(id: usr.id,token: usr.token)
      ..usrname = usr.usrname
      ..email = usr.email
      ..password = usr.password
      ..isAdmin = usr.isAdmin;

    await instance.writeTxn(() async {
      await instance.userCollections.put(newUser); // Insertion & modification
    });
  }

  @override
  Future<String> getToken() async {
    var instance = await isar.db;
    var userCollection = instance.userCollections;

    var user = await userCollection.filter().tokenIsNotEmpty().findFirst();

    return user?.token ?? '';
  }

  @override
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

  @override
  List getFavoriteProducts() {
    throw UnimplementedError();
  }
}
