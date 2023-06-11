
import 'package:front/features/content/domain/entity/product.dart';

abstract class ProductLocalRepository {
  void addProductList(List<Product> product);
  List<Product> getProducts();
  List<Product> getProductsFilter(List<dynamic> params);
  void addToFavorite(Product product);
  // void addToCard
}