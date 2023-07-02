import 'package:front/core/usecase.dart';
import 'package:front/core/utils/data_state.dart';
import 'package:front/features/content/domain/entity/product.dart';
import 'package:front/features/content/domain/repository/product_repository.dart';

class GetAllProduct implements UseCase<DataState, void> {
  final ProductRepository _productRepository;

  GetAllProduct(this._productRepository);
  @override
  Future<DataState> call({void params}) async {
    DataState res;
    res = await _productRepository.getAllProducts();
    if (res.runtimeType == DataSuccess<Product>) {
      return DataSuccess(res);
    } else {
      return res;
    }
  }
}
