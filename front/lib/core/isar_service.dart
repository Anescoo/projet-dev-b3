import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:front/core/collections/product_collection.dart';
import 'package:front/core/collections/user_collection.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class IsarService {
  late Future<Isar> db;
  String userToken = " ";

  IsarService() {
    db = openDb();
  }
  String get getToken =>userToken;

  set setToken(String token) => userToken = token;

  Future<Isar> openDb() async {
    WidgetsFlutterBinding.ensureInitialized();

    final dir = await getApplicationDocumentsDirectory();
    print(dir.path);

    if (Isar.instanceNames.isEmpty) {
      if (Platform.isAndroid || Platform.isIOS) {
        //! i dont have the permission to use the storage on android
        // Vérifier l'autorisation et demander si nécessaire
        if (await Permission.storage.request().isGranted) {
                  print("using new instance");
          return await Isar.open(
            [UserCollectionSchema, ProductCollectionSchema],
            directory: dir.path,
            inspector: true,
          );
        } else {
          // Gérer le refus d'autorisation
          throw Exception('Autorisation de stockage refusée');
        }
      } else {
        print("using old instance");
        return await Isar.open(
          [UserCollectionSchema],
          directory: dir.path,
          inspector: true,
        );
      }
    }

    return Future.value(Isar.getInstance());
  }
}
