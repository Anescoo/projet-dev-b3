import 'package:flutter/material.dart';
import 'package:front/constatns.dart';
import 'package:front/features/products/product_model.dart';

class Details extends StatelessWidget {
  final ProductModel product;

  const Details({
    Key? key,
    required this.product,
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
            TextButton(onPressed: () {}, child: Text('add to cardt'))
          ],
        ),
      ),
    );
  }
}
