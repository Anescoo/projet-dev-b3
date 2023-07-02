import 'package:front/features/users/domain/entity/user.dart';
import 'package:isar/isar.dart';

part 'user_collection.g.dart';

@Collection(ignore: {'favoriteProducts', 'props'})
class UserCollection extends User {
  final Id isarId = 1;
  // List<int>? favorites; !FIX

  const UserCollection(
      {required super.token,
      required super.id,
      required super.usrname,
      required super.email,
      required super.password,
      required super.isAdmin});
}
