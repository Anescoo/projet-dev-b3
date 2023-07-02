
import 'package:front/core/utils/data_state.dart';

abstract class ProductRepository {
  Future<DataState> getAllProducts();
}