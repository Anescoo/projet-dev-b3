import 'package:front/core/utils/data_state.dart';
import 'package:front/features/content/data/datasource/local/product_local_service.dart';
import 'package:front/features/content/data/datasource/remote/product_api_service.dart';
import 'package:front/features/content/data/model/product_model.dart';
import 'package:front/features/content/domain/entity/product.dart';
import 'package:front/features/content/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductApiService _productApiService;
  final ProductLocalService _productLocalService;

  ProductRepositoryImpl(this._productApiService, this._productLocalService);

  @override
  Future<DataState> getAllProducts() async {
    List<ProductModel> res = await _productApiService.getAllProducts();
    if (res == []) {
      return DataFailed(["no product fetch"]);
    }
    List<Product> productList = res;
    _productLocalService.addProductList(productList);
    return DataSuccess(productList);
  }
}
