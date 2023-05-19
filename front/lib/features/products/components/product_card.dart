import 'package:flutter/material.dart';
import 'package:front/features/order/order_controller.dart';
import 'package:front/features/products/components/product_details.dart';
import 'package:front/features/products/product_controller.dart';
import 'package:front/features/products/product_model.dart';
import 'package:get/get.dart';

import '../../../constatns.dart';

class ProductCard extends StatelessWidget {
  final int index;
  final ProductModel product;
  final ProductController productController;
  final OrderController orderController;
  const ProductCard({
    Key? key,
    required this.index,
    required this.product,
    required this.productController,
    required this.orderController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("object");
        // productController.isDetail.value = true;
        Navigator.of(context).push(MaterialPageRoute(
          //! make the buttom menu stay still on details widget and on the product widget
          builder: (context) => Details(
            product: product,
            productController: productController,
            orderController: orderController,
          ),
        ));
      },
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: backGround,
            child: Column(
              children: [
                Image.network(
                  product.imageUrl,
                  height: 100,
                ),
                Text(
                  'Item $index',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  "${product.prince} €",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          )),
    );
  }
}
