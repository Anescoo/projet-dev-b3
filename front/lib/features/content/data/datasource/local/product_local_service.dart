
import 'package:front/core/isar_service.dart';
import 'package:front/features/content/domain/entity/product.dart';
import 'package:front/features/content/domain/repository/product_local_repository.dart';

class ProductLocalService implements ProductLocalRepository {
  IsarService isar;
  ProductLocalService(this.isar);
  @override
  void addProductList(List<Product> product) {
    // TODO: implement addProductList
  }

  @override
  void addToFavorite(Product product) {
    // TODO: implement addToFavorite
  }

  @override
  List<Product> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  List<Product> getProductsFilter(List params) {
    // TODO: implement getProductsFilter
    throw UnimplementedError();
  }
  
}