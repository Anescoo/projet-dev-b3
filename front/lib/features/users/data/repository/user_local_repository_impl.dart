import 'package:front/core/collections/user_collection.dart';
import 'package:front/core/isar_service.dart';
import 'package:front/features/users/domain/entity/user.dart';
import 'package:front/features/users/domain/repository/user_local_repository.dart';
import 'package:isar/isar.dart';

class UserLocalRepositoryImpl implements UserLocalRepository {
  IsarService isar;
  UserLocalRepositoryImpl(this.isar);

  @override
  void addUser(User usr) async {
    var instance = await isar.db;

    UserCollection? localDbUser = await getUser();

    //user already exist
    if (localDbUser?.email == usr.email) {
      UserCollection userUpdate = UserCollection(
          id: localDbUser!.id,
          token: usr.token,//* we update the token since it change for each connexion
          usrname: localDbUser.usrname,
          email: localDbUser.email,
          password: localDbUser.password,
          isAdmin: localDbUser.isAdmin);
      isar.setToken = usr.token;
      //update user data
      await instance.writeTxn(() async {
        await instance.userCollections.put(userUpdate); // modification
      });
    } else {
      // user not in the local db => create the new user
      UserCollection newUser = UserCollection(
          token: usr.token,
          id: usr.id,
          usrname: usr.usrname,
          email: usr.email,
          password: usr.password,
          isAdmin: usr.isAdmin);
      await instance.writeTxn(() async {
        await instance.userCollections.put(newUser); // Insertion 
      });
    }
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

  @override
  Future<UserCollection?> getUser() async {
    var instance = await isar.db;
    final usrColl = instance.collection<UserCollection>();
    // var loggedUser = 
    // return User(
    //     id: loggedUser!.id,
    //     token: loggedUser.token,
    //     usrname: loggedUser.usrname,
    //     email: loggedUser.email,
    //     password: loggedUser.password,
    //     isAdmin: loggedUser.isAdmin);
    return await usrColl.get(1);
  }
}
