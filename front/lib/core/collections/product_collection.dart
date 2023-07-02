import 'package:isar/isar.dart';

import '../../features/content/domain/entity/product.dart';

part 'product_collection.g.dart';

@Collection(ignore: { 'props'})
class ProductCollection extends Product {
  final Id isarId = Isar.autoIncrement;

  const ProductCollection(
      {required super.productId,
      required super.name,
      required super.description,
      required super.price,
      required super.imageUrl,
      required super.productQuantity});
}
