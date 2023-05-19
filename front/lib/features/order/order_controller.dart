import 'package:get/get.dart';

import '../products/product_controller.dart';
import '../products/product_model.dart';

class OrderController extends GetxController {
  var _productOrder = {}.obs;

  void addProduct(ProductModel product) {
    if (_productOrder.containsKey(product)) {
      _productOrder[product] += 1;
      print(product.name);
      print(_productOrder[product]);
    } else {
      _productOrder[product] = 0;
    }
  }

  int getCardLength() {
    return _productOrder.length;
  }

  get products => _productOrder;
}