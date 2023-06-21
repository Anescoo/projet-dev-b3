import 'package:front/core/usecase.dart';
import 'package:front/core/utils/data_state.dart';
import 'package:front/features/content/domain/repository/product_repository.dart';

class GetAllProduct implements UseCase<DataState, String> {
  final ProductRepository _productRepository;

  GetAllProduct(this._productRepository);
  @override
  Future<DataState> call({String? params}) {
    if (params != null) {
      return _productRepository.getAllProducts(params);
    }
    return  Future.value(DataFailed(["error,no response"]));
  }
  
}