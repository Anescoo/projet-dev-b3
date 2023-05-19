import 'package:flutter/material.dart';
import 'package:front/constatns.dart';
import 'package:front/features/order/order_controller.dart';
import 'package:front/features/products/product_controller.dart';
import 'package:front/features/products/product_model.dart';
import 'package:get/get.dart';

class Details extends StatelessWidget {
  final ProductModel product;
  final ProductController productController;
  final OrderController orderController;

  const Details({
    Key? key,
    required this.product,
    required this.productController,
    required this.orderController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backGround,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              product.imageUrl,
              height: 100,
            ),
            Text(
              product.description,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "${product.prince} €",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            TextButton(
                onPressed: () {
                  orderController.addProduct(product);
                },
                child: Text('add to card'))
          ],
        ),
      ),
    );
  }
}
