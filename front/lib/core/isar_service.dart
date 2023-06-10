import 'package:front/core/collections/user_collection.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

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
