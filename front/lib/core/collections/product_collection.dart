import 'package:isar/isar.dart';

part 'product_collection.g.dart';
@collection
class ProductCollection {
  Id isarId = Isar.autoIncrement;
  String? productName;
}
