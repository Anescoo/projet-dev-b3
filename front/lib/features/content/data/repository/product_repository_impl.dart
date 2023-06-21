import 'package:front/core/utils/data_state.dart';
import 'package:front/features/content/data/datasource/local/product_local_service.dart';
import 'package:front/features/content/data/datasource/remote/product_api_service.dart';
import 'package:front/features/content/data/model/product_model.dart';
import 'package:front/features/content/domain/entity/product.dart';
import 'package:front/features/content/domain/repository/product_repository.dart';
import 'package:front/features/users/domain/entity/user.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductApiService _productApiService;
  final ProductLocalService _productLocalService;

  ProductRepositoryImpl(this._productApiService, this._productLocalService);

  @override
  Future<DataState> getAllProducts(String usrToken) async {
    List<ProductModel> res = await _productApiService.getAllProducts(usrToken);
    if (res == []) {
      return DataFailed(["no product fetch"]);
    }
    List<Product> productList = res;
    _productLocalService.addProductList(productList);
    return DataSuccess(productList);
  }
}
