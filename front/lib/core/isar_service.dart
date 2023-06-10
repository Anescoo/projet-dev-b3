import 'package:front/core/collections/user_collection.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
/// the user and content modules are gonna need that instance of isar
/// that's why i seperate the implementation of that instance in that classe
/// when a module need it , it just use that class and it will get the instance
class IsarService {
  late Future<Isar> db;
  IsarService() {
    db = openDb();
  }

  Future<Isar> openDb() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([UserCollectionSchema],
          directory: dir.path, inspector: true);
    }
    return Future.value(Isar.getInstance());
  }


}
